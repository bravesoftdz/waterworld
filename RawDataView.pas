unit RawDataView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TRawDataForm = class(TForm)
    pnlTop: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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


end.