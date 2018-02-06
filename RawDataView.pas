unit RawDataView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids;

type
  TRawDataForm = class(TForm)
    pnlTop: TPanel;
    lblBuses: TLabel;
    lblGenerators: TLabel;
    lblLoad: TLabel;
    lblEstWithdrawal: TLabel;
    lblEstConsumption: TLabel;
    GrpBoxCaseInfo: TGroupBox;
    GrpBoxWaterInfo: TGroupBox;
    GrpBoxGeneration: TGroupBox;
    GrpBoxCooling: TGroupBox;
    lblCaseName: TLabel;
    lblWind: TLabel;
    lblNuc: TLabel;
    lblCoal: TLabel;
    lblNGas: TLabel;
    lblOpenLoop: TLabel;
    lblClosedLoop: TLabel;
    pagectrlRawData: TPageControl;
    tabshBranches: TTabSheet;
    tabshGeneration: TTabSheet;
    tabshCosts: TTabSheet;
    strgrdBranches: TStringGrid;
    strgrdGens: TStringGrid;
    strgrdCosts: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataViewForm: TRawDataForm;

implementation

{$R *.dfm}

procedure TRawDataForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRawDataForm.FormCreate(Sender: TObject);
begin
  // CaseName Label
  lblCaseName.Caption := 'CASENAME';
  lblCaseName.Font.Size := 12;
  lblCaseName.Font.Style := [fsBold];

  // Label Initialization
  lblBuses.Caption := 'No. of Buses:';
  lblGenerators.Caption := 'No. of Generators (Total MW):';
  lblLoad.Caption := 'Total Load:';
  lblEstWithdrawal.Caption := 'Total Withdrawal (gal)';
  lblEstConsumption.Caption := 'Total Consumption (gal)';
  lblWind.Caption := 'Wind:';
  lblNuc.Caption := 'Nuclear:';
  lblCoal.Caption := 'Coal:';
  lblNGas.Caption := 'NGas:';
  lblOpenLoop.Caption := 'Open-Loop:';
  lblClosedLoop.Caption := 'Closed-Loop:';

  // GroupBox Captions
  GrpBoxCaseInfo.Caption := 'General Case Info';
  GrpBoxWaterInfo.Caption := 'Water Usage';
  GrpBoxGeneration.Caption := 'Fuel Breakdown';
  GrpBoxCooling.Caption := 'Cooling Breakdown';
end;

end.