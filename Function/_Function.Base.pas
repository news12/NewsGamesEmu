unit _Function.Base;

interface

Uses
  System.SysUtils,
  Vcl.StdCtrls,
  Base.LoadConfig,
  Base.Struct,
  System.Win.ScktComp,
  Log.DB;

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
    class function ByteToHex(InByte: byte): String;
    class function GetClientID(H: Cardinal): Word;
    class procedure LoadSocket;
    Destructor Destroy; override;

  End;

implementation

Uses
  Form.Main;

Var
  LoadConfig: TLoadConfig;
  LogDB: TLog;

Constructor TFunction.Create;
begin
  LoadConfig := TLoadConfig.Create;
  LogDB := TLog.Create;
  sServer := TServerSocket.Create(Nil);
end;

class procedure TFunction.LoadSocket;
begin
  try
    sServer.Port := JsonConection.PORTA_SERVER;
    sServer.Active := True;
    LogDB.DBLog(fMain.rStatus, 'Server Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' + IntToStr(JsonConection.PORTA_SERVER)
      + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IPSERVER + ']', 2);
  Except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_SERVER) + ']', 1);
  end;
end;

// pega o id do cliente no Handle do Socket
class function TFunction.GetClientID(H: Cardinal): Word;
var
  I: Word;
begin
  Result := 0;
  for I := 1 to MaxPlayer do
  begin
    if Client[I].Handle = H then
    begin
      Result := I;
      break;
    end;
  end;
end;

/// /Faz do byte uma String[Hexadecimal]
class function TFunction.ByteToHex(InByte: byte): String;
const
  Digits: array [0 .. 15] of Char = '0123456789ABCDEF';
begin
  Result := Digits[InByte shr 4] + Digits[InByte and $0F];
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
  LogDB.Free;
  sServer.Free;
  inherited;
end;

end.
