unit Thread.Generic;

interface

uses
  System.Classes,
  Form.Main,
  _Function.Base,
  Base.Struct;

type
  TThreadGeneric = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;

  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TThreadGeneric }

Var
  BaseFunction: TFunction;

constructor TThreadGeneric.Create;
begin
  BaseFunction := TFunction.Create;
  inherited Create(True);
end;

procedure TThreadGeneric.Execute;
begin
  inherited;
  while Not Terminated do
  begin
    BaseFunction.DateHourLabel(fMain.lblServerTimer);
    Sleep(OneSec);
  end;
end;

destructor TThreadGeneric.Destroy;
begin

  inherited;
end;

end.
