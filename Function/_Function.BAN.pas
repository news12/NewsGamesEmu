unit _Function.BAN;

interface

Uses
  Packet.Main,
  Base.Struct,
  _Function.DC;

Type
  TFunctionBAN = Class
  Private

  Public
    constructor create;

    class procedure BAN(ClientID: Word; Mensagem: string);

    destructor destroy; override;
  End;

implementation

Var
  FunctionDC: TFunctionDC;

constructor TFunctionBAN.create;
begin
  FunctionDC := FunctionDC.create;
end;

class procedure TFunctionBAN.BAN(ClientID: Word; Mensagem: string);
begin
  // Informa o motivo
  // chatGM(ClientID, ' Banido : ' + Mensagem);
  // insere nos logs
  // pLog(rStatus,Player[ClientID].User + ';banido;' + Mensagem,1);
  // da ban na conta
  Player[ClientID].Online := 6;
  FunctionDC.DC(ClientID);
end;

destructor TFunctionBAN.destroy;
begin
  FunctionDC.Free;
  inherited;
end;

end.
