unit _Function.Notice;

interface

Type
  TFunctionNotice = class
  Private
    { Private Class }

  Public
    { Public Class }
    class procedure Notice(Clientid: word; Menssagem: ShortString);
  end;

implementation

Uses
  Form.Main,
  Base.Def,
  Base.Key,
  windows,
  sysutils,
  Base.Struct,
  Packet.Main;

{ ###############################################################################
  Noticia para o personagem
  ############################################################################### }
class procedure TFunctionNotice.Notice(Clientid: word; Menssagem: ShortString);
var
  p: p101;
  x: byte;
begin
  zeromemory(@p, sizeof(p));
  p.Header.Code := $101;
  p.Header.Index := 0;
  p.Header.Size := sizeof(p);
  for x := 0 to length(Menssagem) do
  begin
    if ord(Menssagem[x]) = 0 then
      Break;

    p.Menssagem[x] := Menssagem[x];
  end;
  p.Menssagem[0] := ' ';
  Move(p, Sdec, sizeof(p));
  Encode(sizeof(p));
  PacketMain.SendPacket(Clientid, sizeof(p));
end;

end.
