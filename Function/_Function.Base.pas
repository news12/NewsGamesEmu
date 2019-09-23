unit _Function.Base;

interface

Uses
  System.SysUtils,
  Vcl.StdCtrls,
  Base.LoadConfig,
  Form.Main;

Type
  TFunction = Class
  Protected
    { Class Protected }

  Private
    { Class Private }

  Public
    { Class Public }
    Constructor Create;

    class Function DateHourLabel(vLabel: TLabel): String;
    class Procedure CarregaJson;

    Destructor Destroy; override;

  End;

implementation

Var
  LoadConfig: TLoadConfig;

Constructor TFunction.Create;
begin
  LoadConfig := TLoadConfig.Create;
end;

class Procedure TFunction.CarregaJson;
begin
  LoadConfig.LoadFiles(fMain.rStatus);

end;

class Function TFunction.DateHourLabel(vLabel: TLabel): String;
var
  Data: String;
  Hora: String;
begin
  Data := FormatDateTime('dd/mm/yyyy', Date);
  Hora := FormatDateTime('H:mm:ss', Time);
  vLabel.Caption := Data + ' | ' + Hora;
end;

Destructor TFunction.Destroy;
begin
  LoadConfig.Free;
  inherited;
end;

end.
