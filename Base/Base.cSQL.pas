unit Base.cSQL;

interface

uses
  Data.SqlExpr, System.Classes, FireDAC.Comp.Client;

type
  TSql = class(TFDQuery)
  public
    constructor Create(Aowner: TComponent); override;
  end;

  SqlComand = class(TFDCommand)
  public
    constructor Create(Aowner: TComponent); override;
  end;

implementation

{ TSql }

uses Base.GetConexao;

constructor TSql.Create(Aowner: TComponent);
begin
  inherited;
  Connection := TGetConexao.Conexao;
end;

constructor SqlComand.Create(Aowner: TComponent);
begin
  inherited;
  Connection := TGetConexao.Conexao;
end;

end.
