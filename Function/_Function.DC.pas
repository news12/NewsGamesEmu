unit _Function.DC;

interface

Uses
  Packet.Main,
  Base.Struct;

Type
  TFunctionDC = Class
  Private

  Public
    constructor create;

    class procedure DC(ClientID: Word);

    destructor destroy; override;
  End;

implementation

constructor TFunctionDC.create;
begin

end;

class procedure TFunctionDC.DC(ClientID: Word);
begin
  sServer.Socket.Connections[Client[ClientID].Conect].Close;

end;

destructor TFunctionDC.destroy;
begin

  inherited;
end;

end.
