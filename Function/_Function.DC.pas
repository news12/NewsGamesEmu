unit _Function.DC;

interface

Uses
  Packet.Main;

Type
  TFunctionDC = Class
  Private

  Public
    constructor create;

    class procedure DC(ClientID: Word; Channel: Word = 0);

    destructor destroy; override;
  End;

implementation

Uses
  Base.Struct;

constructor TFunctionDC.create;
begin

end;

class procedure TFunctionDC.DC(ClientID: Word; Channel: Word);
begin
  sChannel[Channel].Socket.Connections[Client[ClientID].Conect].Close;

end;

destructor TFunctionDC.destroy;
begin

  inherited;
end;

end.
