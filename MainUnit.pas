unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnMenus, Vcl.RibbonActnMenus, Vcl.RibbonLunaStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.Tabs, Vcl.ComCtrls,
  Vcl.ImgList, pwrworld_TLB, SimAutoCmds, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.StdActns;

type
  TForm1 = class(TForm)
    RibbonActionManager: TActionManager;
    Ribbon1: TRibbon;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonPageSimAuto: TRibbonPage;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    RibbonGrpConnection: TRibbonGroup;
    RibbonPageDataAnalysis: TRibbonPage;
    MainMenu1: TMainMenu;
    RibbonGroupSimAutoCase: TRibbonGroup;
    TabControl1: TTabControl;
    RibGrpData1: TRibbonGroup;
    ActionCompareData: TAction;
    ImgListRibbonButtons: TImageList;
    RibGrpData2: TRibbonGroup;
    pnlMainPanel: TPanel;
    ActionSimAutoConnect: TAction;
    ActionSimAutoDisconnect: TAction;
    ActionOpenSimAutoCase: TFileOpen;
    BrowseForFolder: TBrowseForFolder;
    procedure EnableActions;
    procedure DisableActions;
    procedure FormCreate(Sender: TObject);
    procedure ActionSimAutoConnectExecute(Sender: TObject);
    procedure ActionSimAutoDisconnectExecute(Sender: TObject);
    procedure BrowseForFolderBeforeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TForm1;
  SimAuto: ISimulatorAuto;
  CurrCasePath: string;

function SimAutoConnect: ISimulatorAuto;
procedure SimAutoDisconnect(SimAutoObj: ISimulatorAuto);

implementation

{$R *.dfm}
{ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                           Form Initialization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }
procedure TForm1.EnableActions;
begin
  ActionSimAutoDisconnect.Enabled := True;
  ActionOpenSimAutoCase.Enabled := True;
end;

procedure TForm1.DisableActions;
begin
  ActionSimAutoDisconnect.Enabled := False;
  ActionOpenSimAutoCase.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  SimAuto := nil;
  // Disable all actions (since a case isn't open)
  DisableActions;

  // Ribbon Group Editing

  // This FileOpen object should only open pwb cases
  ActionOpenSimAutoCase.Dialog.Filter := 'PowerWorld Binary (*.pwb)|*.pwb';
end;


{ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                        SimAuto Connect/Disconnect
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }

function SimAutoConnect: ISimulatorAuto;
begin
    // Attempt to connect to the server
    Screen.Cursor := crHourGlass;
    try
      Result := CoSimulatorAuto.Create;
      ShowMessage('Automation server connection successful!');
    except
      on E : Exception do begin
        ShowMessage('Connection failed via'+ E.ClassName+' error raised with message : '+E.Message);
        Result := nil;
      end;
    end;
    Screen.Cursor := crDefault;
end;

procedure SimAutoDisconnect(SimAutoObj: ISimulatorAuto);
begin
    // Re-initialize the server variable
    SimAutoObj := nil;
    ShowMessage('Disconnected from SimAuto!');
end;

{ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                Functions relating to the SimAutoConnection ribbon group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }

procedure TForm1.ActionSimAutoConnectExecute(Sender: TObject);
begin
  SimAuto := SimAutoConnect;
  if SimAuto <> nil then begin
    // If succesfully connected, enable the disconnect button and
    // disable the connect button
    ActionSimAutoConnect.Enabled := False;
    ActionSimAutoDisconnect.Enabled := True;
  end;
end;

procedure TForm1.ActionSimAutoDisconnectExecute(Sender: TObject);
var
  Output: OleVariant;
begin
  Output:= SimAuto.CloseCase;
  if (string(Output[0]) <> '') then
    ShowMessage(string(Output[0]))
  else begin
    SimAutoDisconnect(SimAuto);
    // Disable the disconnect button and enable the connect button
    ActionSimAutoConnect.Enabled := True;
    ActionSimAutoDisconnect.Enabled := False;
  end;
end;

procedure TForm1.BrowseForFolderBeforeExecute(Sender: TObject);
var
  selectedFile   : string;
begin
  if PromptForFileName(selectedFile,
                'Case files (*.pwb)|*.pwb',
                '', 'Select a PowerWorld case',
                'C:\', False)  // False = NOT a 'Save' dialog
  then begin
    btnOpenCase.Enabled := True;
    lblCasePath.Caption := ExtractFilePath(selectedFile);
    lblFileName.Caption := ExtractFileName(selectedFile);
    CurrCasePath := selectedFile;
  end;
end;

{ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                Functions relating to the SimAutoConnection ribbon group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ }

end.
