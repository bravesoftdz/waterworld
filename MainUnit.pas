unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnCtrls, Vcl.Ribbon, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnMenus, Vcl.RibbonActnMenus, Vcl.RibbonLunaStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Grids, Vcl.Tabs, Vcl.ComCtrls,
  Vcl.ImgList, pwrworld_TLB, SimAutoCmds;

type
  TForm1 = class(TForm)
    RibbonActionManager: TActionManager;
    Ribbon1: TRibbon;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonPageSimAuto: TRibbonPage;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    RibbonGroup1: TRibbonGroup;
    RibbonPageDataAnalysis: TRibbonPage;
    MainMenu1: TMainMenu;
    RibbonGroup2: TRibbonGroup;
    TabControl1: TTabControl;
    RibGrpData1: TRibbonGroup;
    ActionCompareData: TAction;
    ImgListRibbonButtons: TImageList;
    ActSimAutoConnection: TAction;
    RibGrpData2: TRibbonGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TForm1;

implementation

{$R *.dfm}

end.
