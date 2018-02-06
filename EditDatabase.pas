unit EditDatabase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Datasnap.DBClient;

type
  TfrmDatabase = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Date: TDateField;
    ClientDataSet1TemperatureC: TIntegerField;
    ClientDataSet1Streamflow: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatabase: TfrmDatabase;

implementation

{$R *.dfm}

procedure TfrmDatabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
