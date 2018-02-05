unit SimAutoCmds;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pwrworld_TLB, System.UITypes, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.Grids;


function SimAutoConnect: ISimulatorAuto;
procedure SimAutoDisconnect(SimAuto: ISimulatorAuto);

implementation

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
      end;
    end;
    Screen.Cursor := crDefault;
end;

procedure SimAutoDisconnect(SimAuto: ISimulatorAuto);
begin
    // Re-initialize the server variable
    SimAuto := nil;
    ShowMessage('Disconnected from SimAuto!');
end;


end.
