unit Timer.Main;

interface

Uses
  System.Classes,
  System.SysUtils,
  FireDAC.Comp.Client,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Base.Struct,
  Form.Modulo,
  DB.Conect,
  _Function.Base,
  Timer.DB;

Type
  TTimerMain = Class
  Private
    { Class Private }
    class procedure StartTimers(Sender: TObject);

  Public
    { Class Public }
    constructor create;
    class procedure StartMainTimer(Sender: TObject);
    destructor destroy; override;

  End;

implementation

Var
  TimerMain: TTimer;
  TimerDB: TTimerDB;

constructor TTimerMain.create;
begin
  TimerMain := TTimer.create(Nil);
  TimerDB := TTimerDB.create;
end;

class procedure TTimerMain.StartTimers(Sender: TObject);
Var
  Started: Boolean;
begin
  if Not Started then
  begin
    Started := True;
    try
      TimerDB.StartDBTimer(Sender);
      TimerMain.Enabled := False;
    Except
      TimerMain.Enabled := True;
    end;
    Started := False;
  end;
end;

class procedure TTimerMain.StartMainTimer(Sender: TObject);
begin
  TimerMain.Enabled := True;
  TimerMain.Interval := Fivesec;
  TimerMain.OnTimer := StartTimers;
end;

destructor TTimerMain.destroy;
begin
  TimerMain.Free;
  TimerDB.Free;
  inherited;
end;

end.
