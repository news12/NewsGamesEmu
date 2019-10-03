unit Log.DB;

interface

Uses
  Vcl.ComCtrls,
  FireDAC.Comp.Client,
  DB.Conect,
  System.SysUtils,
  Form.Main;

Type
  tLog = Class
  Protected
    { Protected Class }

  Private
    { Private Class }

  Public
    { Public Class }
    constructor Create;
    class procedure DBLog(Log: TRichEdit; Msg: String; Tipo: Integer);
    destructor Destroy; override;

  End;

Var
  nConection: TDBConect;

implementation

Uses
  Base.Color,
  Base.Struct;

constructor tLog.Create;
begin
  nConection := TDBConect.Create;
end;

class procedure tLog.DBLog(Log: TRichEdit; Msg: String; Tipo: Integer);
Var
  Cor: Integer;
  qLog: TFDQuery;
  uSQL: String;
begin
  case Tipo of
    0: // Sucess
      Cor := VerdeC;
    1: // Error
      Cor := VermelhoC;
    2: // Notificaton
      Cor := AzulC;
    3: // Normal
      Cor := Branco;
    4:
      Cor := Laranja
  else
    Cor := Cinza;
  end;
  Log.SelAttributes.Color := Cor;
  Log.Lines.Add(Msg);
  uSQL := 'WHERE ID = 0';
  qLog := nConection.SelectTable(TableLog, '', '', uSQL);
  With qLog Do
  begin
    Try
      Insert;
      FieldByName('DATA').AsDateTime := Date;
      FieldByName('DATA_HORA').AsDateTime := Time;
      FieldByName('DESCRICAO').AsString := Msg;
      Post;
    Except
      On E: Exception do
      begin
        // DBLog(FMain.rStatus, E.Message, 1);
        exit;
      end;
    End;
  end;

end;

destructor tLog.Destroy;
begin
  nConection.Free;
  inherited;

end;

end.
