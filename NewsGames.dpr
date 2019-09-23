program NewsGames;

uses
  Vcl.Forms,
  Form.Main in 'Form\Form.Main.pas' {fMain},
  Thread.DB in 'Thread\Thread.DB.pas',
  Thread.Main in 'Thread\Thread.Main.pas',
  Form.Modulo in 'Form\Form.Modulo.pas' {DM: TDataModule},
  DB.Conect in 'DB\DB.Conect.pas',
  Base.Color in 'Base\Base.Color.pas',
  Base.GetConexao in 'Base\Base.GetConexao.pas',
  Base.cSQL in 'Base\Base.cSQL.pas',
  Base.Crypt in 'Base\Base.Crypt.pas',
  Base.System.Json.Helper in 'Base\Base.System.Json.Helper.pas',
  Base.System.JsonFiles in 'Base\Base.System.JsonFiles.pas',
  Base.Key in 'Base\Base.Key.pas',
  Base.LoadConfig in 'Base\Base.LoadConfig.pas',
  Base.Struct in 'Base\Base.Struct.pas',
  Log.DB in 'Log\Log.DB.pas',
  Json.Conection in 'Json\Json.Conection.pas',
  Json.LangDB in 'Json\Json.LangDB.pas',
  Base.Def in 'Base\Base.Def.pas',
  Json.Status in 'Json\Json.Status.pas',
  _Function.Base in 'Function\_Function.Base.pas',
  Thread.Generic in 'Thread\Thread.Generic.pas',
  Packet.Main in 'Packet\Packet.Main.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
