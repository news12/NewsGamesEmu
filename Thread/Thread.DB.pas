unit Thread.DB;

interface

Uses
  System.Classes,
  FireDAC.Comp.Client,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Dialogs,
  Vcl.ExtCtrls
  // uStruct,
  // uDM,
  // uFunc
    ;

Type
  tThreadDB = class(TThread)
  protected
    procedure Execute; override;

  private
    procedure LogOutAcc;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

Uses
  Form.Modulo,
  Form.Main,
  Base.Struct,
  DB.Conect,
  Log.DB;

Var
  nConection: TDBConect;
  nLogDB: TLog;

constructor tThreadDB.Create;
begin
  nConection := TDBConect.Create;
  nLogDB := TLog.Create;
  inherited Create(True);
end;

procedure tThreadDB.LogOutAcc;
var
  //Verific: Boolean;
  vQuery: TFDQuery;
  vSQL: String;
  pName: String;
begin

  vSQL := 'WHERE STATUS = 0 AND LOGOUT = 1';
  vQuery := nConection.SelectTable(TableAccount, '*', '', vSQL);

  if Not vQuery.IsEmpty then
  begin
    pName := vQuery.FieldByName('login').AsString;
    vQuery.Edit;
    vQuery.FieldByName('LOGOUT').AsInteger := 0;
    vQuery.Post;
    DM.Connection.Commit;
    // atualizar componente vcl
    Synchronize(
      procedure
      begin
        nLogDB.DBLog(fMain.rStatus, 'o Jogador :[' + pName +
          '] desconectou do jogo!!!', 2);
      end);

  end;
  vQuery.Free;
end;

procedure tThreadDB.Execute;
begin
  inherited;
  While not Terminated do
  begin
    LogOutAcc;
    Sleep(FiveSec);

  end;
  // Nunca vai chegar aqui, WaitFor em loop
end;

destructor tThreadDB.Destroy;
begin
  nConection.Free;
  nLogDB.Free;
  inherited;
end;

end.
