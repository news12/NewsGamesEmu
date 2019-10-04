unit Thread.Main;

interface

Uses
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Form.Modulo,
  Thread.DB,
  DB.Conect,
  Thread.Generic,
  _Function.Base,
  _Function.BAN;

Type
  tThreadMain = class(TThread)
  protected
    procedure Execute; override;

  private
    { Private class }

  public
    { Public class }
    constructor Create;
    destructor Destroy; override;
  end;

Var
  FunctionBase: Tfunction;

Implementation

Uses
  System.Win.ScktComp,
  Form.Main,
  Base.Struct;

var
  ThreadDB: tThreadDB;
  ThreadGeneric: TThreadGeneric;
  DBConect: TDBConect;

constructor tThreadMain.Create;
begin

  ThreadDB := tThreadDB.Create;
  ThreadGeneric := TThreadGeneric.Create;
  FunctionBase := Tfunction.Create;
  DBConect := TDBConect.Create;
  inherited Create(True);
end;

procedure tThreadMain.Execute;
begin
  inherited;
  while Not Terminated do
  begin
    // if Not ThreadDB.Started then
    // ThreadDB.Start;

    if Not ThreadGeneric.Started then
      ThreadGeneric.Start;

    FunctionBase.CarregaJson;
    DBConect.ConectaDB(fMain.rStatus);
    FunctionBase.LoadSocket;
    Sleep(FiveMin);
  end;
  // OnTerminate := Start;

end;

destructor tThreadMain.Destroy;
begin
  FunctionBase.Free;
  DBConect.Free;
  inherited;
end;

end.
