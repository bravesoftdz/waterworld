program WaterWorld;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  RawDataView in 'RawDataView.pas' {RawDataForm},
  Vcl.Themes,
  Vcl.Styles,
  EditDatabase in 'EditDatabase.pas' {frmDatabase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
