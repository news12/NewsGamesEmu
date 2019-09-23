unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TfMain = class(TForm)
    panelRigth: TPanel;
    panelLeft: TPanel;
    panelBot: TPanel;
    btnClose: TSpeedButton;
    groupTime: TGroupBox;
    lblServerTimer: TLabel;
    btnMinimize: TSpeedButton;
    panelMain: TPanel;
    rStatus: TRichEdit;
    rStatus2: TRichEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

Uses
  Thread.Main;
 // Timer.Main;

Var
  ThreadMain: TThreadMain;
 // TimerMain: TTimerMain;

procedure TfMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
   ThreadMain := TThreadMain.Create;

end;

procedure TfMain.FormShow(Sender: TObject);
begin
  ThreadMain.Start;
end;

end.
