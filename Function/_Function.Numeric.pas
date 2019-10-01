unit _Function.Numeric;

interface

Type
  TFunctionNumeric = Class
  Private
    { Private Class }

  Public
    { Public Class }
    class procedure NumericPass(ClientID: word; Buff: Array of byte);
  End;

implementation

Uses
  form.Main,
  Base.Def,
  Base.key,
  Packet.Main,
  Base.Struct,
  Thread.Main,
  // pnotice,
  // pDC,
  _Function.Base;

class procedure TFunctionNumeric.NumericPass(ClientID: word;
  Buff: Array of byte);
var
  p: pFDE;
begin
  Move(Buff, p, sizeof(p));
  // Se já tiver errado 3x
  if Player[ClientID].NumericError = 3 then
  begin
    Player[ClientID].NumericError := 0;
    Player[ClientID].Online := 7;
    Notice.Notice(ClientID,
      'Errou a senha numérica por 3x, restaure sua conta no site');
    DC.DC(ClientID);
  end
  else
  begin
    // Envia o pacote
    p.Header.Size := 12;
    p.Header.Index := ClientID;
    // Se a senha estiver errada/certa
    if Player[ClientID].Numeric = FunctionBase.GetString(p.Pass, p.Header.Size)
    then
    begin
      p.Header.code := $FDE;
      Player[ClientID].NumericError := 0;
      Move(p, sdec, sizeof(p));
      Encode(sizeof(p));
      PacketMain.SendPacket(ClientID, sizeof(p));
      Client[ClientID].StatusChar := 1;
    end
    else
    begin
      p.Header.code := $FDF;
      Inc(Player[ClientID].NumericError, 1);
      Move(p, sdec, sizeof(p));
      Encode(sizeof(p));
      PacketMain.SendPacket(ClientID, sizeof(p));
      Notice.Notice(ClientID,
        ' Senha incorreta, apenas 3 tentativas antes do bloqueio !');
    end;
  end;

end;

end.
