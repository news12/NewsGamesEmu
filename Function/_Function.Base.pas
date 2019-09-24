unit _Function.Base;

interface

Uses
  System.SysUtils,
  Vcl.StdCtrls,
  Base.LoadConfig,
  System.Win.ScktComp,
  Log.DB;

Type
  TFunction = Class
  Protected
    { Class Protected }

  Private
    class procedure pChannel1;
    class procedure pChannel2;
    class procedure pChannel3;
    class procedure pChannel4;
    class procedure pChannel5;
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
  Form.Main,
  Base.Struct,
  _Function.BAN,
  _Function.DC;

Var
  LoadConfig: TLoadConfig;
  LogDB: TLog;

Constructor TFunction.Create;
begin

  LoadConfig := TLoadConfig.Create;
  LogDB := TLog.Create;
  BAN := TFunctionBAN.Create;
  DC := TFunctionDC.Create;
end;

class procedure TFunction.LoadSocket;
begin
  case MaxChannel of
    1:
      pChannel1;
    2:
      begin
        pChannel1;
        pChannel2;
      end;
    3:
      begin
        pChannel1;
        pChannel2;
        pChannel3;
      end;
    4:
      begin
        pChannel1;
        pChannel2;
        pChannel3;
        pChannel4;
      end;
    5:
      begin
        pChannel1;
        pChannel2;
        pChannel3;
        pChannel4;
        pChannel5;
      end
  else
    begin
      pChannel1;
      pChannel2;
      pChannel3;
      pChannel4;
      pChannel5;
    end;
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
Var
  I: Word;
begin
  try
    LoadConfig.LoadFiles(fMain.rStatus);
    // decrementa 1 pois vamos usar um array
    MaxChannel := JsonConection.MaxChannel - 1;
    setLength(sChannel, MaxChannel);

    for I := 0 to MaxChannel do
    begin
      sChannel[I] := TServerSocket.Create(Nil);
      sChannel[I].Name := 'Schannel' + IntToStr(I);
    end;

  Except
    // erro ao carregar files
  end;

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

class procedure TFunction.pChannel5;
begin
  try
    sChannel[4].Port := JsonConection.PORTA_CHANNEL5;
    sChannel[4].Active := True;
    LogDB.DBLog(fMain.rStatus, 'Channel_5 Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' +
      IntToStr(JsonConection.PORTA_CHANNEL5) + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IP_CHANNEL5 + ']', 2);
  except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_CHANNEL5) + ']', 1);
  end;
end;

class procedure TFunction.pChannel4;
begin
  try
    sChannel[3].Port := JsonConection.PORTA_CHANNEL4;
    sChannel[3].Active := True;
    LogDB.DBLog(fMain.rStatus, 'Channel_4 Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' +
      IntToStr(JsonConection.PORTA_CHANNEL4) + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IP_CHANNEL4 + ']', 2);
  except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_CHANNEL4) + ']', 1);
  end;
end;

class procedure TFunction.pChannel3;
begin
  try
    sChannel[2].Port := JsonConection.PORTA_CHANNEL3;
    sChannel[2].Active := True;
    LogDB.DBLog(fMain.rStatus, 'Channel_3 Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' +
      IntToStr(JsonConection.PORTA_CHANNEL3) + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IP_CHANNEL3 + ']', 2);
  except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_CHANNEL3) + ']', 1);
  end;
end;

class procedure TFunction.pChannel2;
begin
  try
    sChannel[1].Port := JsonConection.PORTA_CHANNEL2;
    sChannel[1].Active := True;
    LogDB.DBLog(fMain.rStatus, 'Channel_2 Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' +
      IntToStr(JsonConection.PORTA_CHANNEL2) + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IP_CHANNEL2 + ']', 2);
  except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_CHANNEL2) + ']', 1);
  end;
end;

class procedure TFunction.pChannel1;
begin
  try
    sChannel[0].Port := JsonConection.PORTA_CHANNEL1;
    sChannel[0].Active := True;
    LogDB.DBLog(fMain.rStatus, 'Channel_1 Started Success!!!', 0);
    LogDB.DBLog(fMain.rStatus, 'Porta: [' +
      IntToStr(JsonConection.PORTA_CHANNEL1) + ']', 2);
    LogDB.DBLog(fMain.rStatus, 'IP: [' + JsonConection.IP_CHANNEL1 + ']', 2);
  except
    LogDB.DBLog(fMain.rStatus, 'Erro ao abrir conex�o de sockets: [' +
      IntToStr(JsonConection.PORTA_CHANNEL1) + ']', 1);
  end;
end;

Destructor TFunction.Destroy;
Var
  I: Integer;
begin
  LoadConfig.Free;
  LogDB.Free;
  // SChannel1.Free;
  // SChannel2.Free;
  // SChannel3.Free;
  // SChannel4.Free;
  for I := 0 to MaxChannel - 1 do
  // decrementa 1 pois iniciamos a contagem do zero
  begin
    sChannel[I].Free;
  end;
  inherited;
end;

end.
