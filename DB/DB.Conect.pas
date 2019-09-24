unit DB.Conect;

interface

Uses
  Vcl.ComCtrls,
  Base.Color,
  FireDAC.Comp.Client,
  Base.GetConexao,
  Winapi.Messages,
  Vcl.Dialogs,
  System.JSON,
  Base.System.JSON.Helper,
  Base.System.JsonFiles,
  System.SysUtils,
  System.Win.ScktComp,
  Winapi.Windows,
  Base.Key,
  Base.Crypt,
  Form.Modulo;

Type
  TDBConect = Class
  Protected
    { Protected class }
  Private
    { Private Class }
  Public
    { Public Class }
    class function SelectTable(pTable: String; pFields: String = '';
      pOrder: String = ''; pSQL: String = ''; pRename: String = ''): TFDQuery;

    class function UpdateTable(tTabela: String; tCampo: String; tValor: String;
      SqlExtra: String = ''): TFDQuery;

    class function ConectaDB(Log: TRichEdit): Boolean;
  End;

implementation

Uses
  Base.Struct;

class function TDBConect.ConectaDB(Log: TRichEdit): Boolean;
begin
  With DM.Connection Do
  begin
    Try

      Connected := False;
      // Params.Clear;
      Params.Values['Database'] := JsonConection.DB;
      Params.Values['DriverID'] := 'MySQL';
      Params.Values['Port'] := IntToStr(JsonConection.PORTA_MYSQL);
      Params.Values['Server'] := JsonConection.IP;
      // Params.Values['HostName']:= Conexao.IP;
      Params.Values['UserName'] := JsonConection.User;
      Params.Values['Password'] := Crypt('D', JsonConection.SENHA);
      Result := True;
      Connected := True;
      LogDB.DBLog(Log, 'MYSQL DB:', 0);
      LogDB.DBLog(Log,
        '.......................................................................'
        + '............................................................OK!!!',
        0);
    Except
      On E: Exception Do
      begin
        LogDB.DBLog(Log, E.Message, 1);
        LogDB.DBLog(Log, 'MYSQL: ' +
          '...........................................................Falha.',
          1);
        Result := False;
        exit;
      end;
    End;
  end;
end;

class function TDBConect.UpdateTable(tTabela: String; tCampo: String;
  tValor: String; SqlExtra: String = ''): TFDQuery;
Var
  Conect: TGetConexao;
begin
  // cria a class de conex�o
  Conect := TGetConexao.Create;
  // cria uma nova query
  Result := TFDQuery.Create(Nil);
  try

    with Result Do
    begin
      Connection := Conect.Conexao;
      Close;
      SQL.clear;
      SQL.Add('UPDATE ' + tTabela); // Monta update dinamico
      SQL.Add('SET ' + tCampo + '=' + tValor);

      // verifica se foi informado um sql extra
      if SqlExtra <> '' then
        SQL.Add(SqlExtra); // adciona o sql extra no select

      ExecSQL;
      // DM.Connection.Commit;
    end;
  Except
    // ShowMessage
    // ('Ocorreu um erro com o update, verifique se os parametros est�o corretos');
  end;
end;

class function TDBConect.SelectTable(pTable: String; pFields: String = '';
  pOrder: String = ''; pSQL: String = ''; pRename: String = ''): TFDQuery;
Var
  Conect: TGetConexao;
begin
  Conect := TGetConexao.Create;

  Result := TFDQuery.Create(Nil); // Cria uma Query dinamica

  Result.Name := pTable;

  try

    with Result Do
    begin
      Connection := Conect.Conexao;
      if pFields = '' then
        pFields := '*';
      Close;
      SQL.clear;
      SQL.Add('SELECT ' + pFields + ' FROM ' + pTable + '' + pRename);
      // Monta select dinamico

      if pSQL <> '' then
        SQL.Add(pSQL);

      if pOrder <> '' then
        SQL.Add('ORDER BY ' + pOrder);

      open;
      // DM.Connection.Commit;
    end;
  Except
    //
  end;
end;

end.
