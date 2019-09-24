unit Base.LoadConfig;

interface

Uses
  System.Classes,
  System.SysUtils,
  Vcl.Forms,
  System.JSON,
  Base.System.JSON.Helper,
  Base.System.JsonFiles,
  Vcl.ComCtrls,
  JSON.Conection,
  JSON.LangDB,
  JSON.Status,
  Log.DB,
  Base.Def,
  Base.Color;

Type
  TLoadConfig = Class
  Private
    // Private Classes
    function LoadConection(Log: TRichEdit): Boolean;
    function LoadLangDB(Log: TRichEdit): Boolean;
    function LoadBaseStatus(Log: TRichEdit): Boolean;

  Public
    // Public Classes
    Constructor Create; // declaração do metodo construtor

    procedure LoadFiles(Log: TRichEdit);

    Destructor Destroy; Override; // declaração do metodo destrutor
  End;

Var
  BaseClass: Array [0 .. 4] of TJsonStatus;

implementation

Uses
 Base.Struct;

constructor TLoadConfig.Create;
Var
  I: Integer;
begin

  JsonConection := TjsonConect.Create;
  JsonLangDB := tJsonLangDB.Create;
  LogDB := Tlog.Create;
  for I := 0 to cBase do
  begin
    BaseClass[I] := TJsonStatus.Create;
  end;

end;

function TLoadConfig.LoadConection(Log: TRichEdit): Boolean;
begin
  cFile := JsonConection.FolderGame + FileConexao;
  jFile := TJsonFile.Create(cFile);
  try
    JsonConection.DB := jFile.ReadString('MYSQL', 'DB', '');
    JsonConection.USER := jFile.ReadString('MYSQL', 'USER', '');
    JsonConection.SENHA := jFile.ReadString('MYSQL', 'SENHA', '');
    JsonConection.PORTA_MYSQL := jFile.ReadInteger('MYSQL', 'PORT', 0);
    JsonConection.IP := jFile.ReadString('MYSQL', 'IP', '');

    JsonConection.MAXCHANNEL := jFile.ReadInteger('CHANNEL', 'MAXCHANNEL', 0);

    JsonConection.PORTA_CHANNEL1 := jFile.ReadInteger('CHANNEL', 'PORT1', 0);
    JsonConection.IP_CHANNEL1 := jFile.ReadString('CHANNEL', 'IP1', '');

    JsonConection.PORTA_CHANNEL2 := jFile.ReadInteger('CHANNEL', 'PORT2', 0);
    JsonConection.IP_CHANNEL2 := jFile.ReadString('CHANNEL', 'IP2', '');

    JsonConection.PORTA_CHANNEL3 := jFile.ReadInteger('CHANNEL', 'PORT3', 0);
    JsonConection.IP_CHANNEL3 := jFile.ReadString('CHANNEL', 'IP3', '');

    JsonConection.PORTA_CHANNEL4 := jFile.ReadInteger('CHANNEL', 'PORT4', 0);
    JsonConection.IP_CHANNEL4 := jFile.ReadString('CHANNEL', 'IP4', '');

    JsonConection.PORTA_CHANNEL5 := jFile.ReadInteger('CHANNEL', 'PORT5', 0);
    JsonConection.IP_CHANNEL5 := jFile.ReadString('CHANNEL', 'IP5', '');

    Log.Clear;
    Log.SelAttributes.Color := Laranja;
    Log.Lines.Add
      ('############################### SERVER EMULATOR ###############################');
    Log.Lines.Add('Banco de Dados: Mysql');
    jFile.ReadSectionValues('MYSQL', Log.Lines);

    LogDB.DBLog(Log, FileConexao + ':', 0);
    LogDB.DBLog(Log,
      '.......................................................................'
      + '............................................................OK!!!', 0);
    Result := True;
  except
    on E: Exception do
    begin
      LogDB.DBLog(Log, E.Message, 1);
      LogDB.DBLog(Log, FileConexao +
        '...........................................................Falha.', 1);
      Result := False;
    end;
  end;
  jFile.Free;
end;

function TLoadConfig.LoadLangDB(Log: TRichEdit): Boolean;
begin
  cFile := JsonConection.FolderGame + FileLangDB;
  jFile := TJsonFile.Create(cFile);
  try
    JsonLangDB.NotAccount := jFile.ReadString('LangDB', 'NotAccount', '');
    JsonLangDB.NumericError := jFile.ReadString('LangDB', 'NumericError', '');
    JsonLangDB.LoggedIn := jFile.ReadString('LangDB', 'LoggedIn', '');
    JsonLangDB.Blocked := jFile.ReadString('LangDB', 'Blocked', '');
    JsonLangDB.Baned := jFile.ReadString('LangDB', 'Baned', '');
    JsonLangDB.ResetPass := jFile.ReadString('LangDB', 'ResetPass', '');
    JsonLangDB.NotFound := jFile.ReadString('LangDB', 'NotFound', '');
    JsonLangDB.CharExists := jFile.ReadString('LangDB', 'CharExists', '');
    JsonLangDB.followingError := jFile.ReadString('LangDB',
      'FollowingError', '');
    LogDB.DBLog(Log, FileLangDB + ':', 0);
    LogDB.DBLog(Log,
      '.......................................................................'
      + '............................................................OK!!!', 0);
    Result := True;
  except
    on E: Exception do
    begin
      Result := False;
      LogDB.DBLog(Log, E.Message, 1);
      LogDB.DBLog(Log, FileLangDB +
        '...........................................................Falha.', 1);
    end;
  end;
  jFile.Free;
end;

function TLoadConfig.LoadBaseStatus(Log: TRichEdit): Boolean;
begin

  cFile := JsonConection.FolderGame + FileBaseStatus;
  jFile := TJsonFile.Create(cFile);
  Try
    // Carrega TK BASE
    BaseClass[TK]._Str := jFile.ReadInteger('TK', 'STR', 0);
    BaseClass[TK].INT := jFile.ReadInteger('TK', 'INT', 0);
    BaseClass[TK].DEX := jFile.ReadInteger('TK', 'DEX', 0);
    BaseClass[TK].CON := jFile.ReadInteger('TK', 'CON', 0);
    // Carrega FM BASE
    BaseClass[FM]._Str := jFile.ReadInteger('FM', 'STR', 0);
    BaseClass[FM].INT := jFile.ReadInteger('FM', 'INT', 0);
    BaseClass[FM].DEX := jFile.ReadInteger('FM', 'DEX', 0);
    BaseClass[FM].CON := jFile.ReadInteger('FM', 'CON', 0);
    // Carrega BM BASE
    BaseClass[BM]._Str := jFile.ReadInteger('BM', 'STR', 0);
    BaseClass[BM].INT := jFile.ReadInteger('BM', 'INT', 0);
    BaseClass[BM].DEX := jFile.ReadInteger('BM', 'DEX', 0);
    BaseClass[BM].CON := jFile.ReadInteger('BM', 'CON', 0);
    // Carrega HT BASE
    BaseClass[HT]._Str := jFile.ReadInteger('HT', 'STR', 0);
    BaseClass[HT].INT := jFile.ReadInteger('HT', 'INT', 0);
    BaseClass[HT].DEX := jFile.ReadInteger('HT', 'DEX', 0);
    BaseClass[HT].CON := jFile.ReadInteger('HT', 'CON', 0);
    // BASE
    BaseClass[cBase].HP := jFile.ReadInteger('BASE', 'HP', 0);
    BaseClass[cBase].MP := jFile.ReadInteger('BASE', 'MP', 0);
    BaseClass[cBase].PosX := jFile.ReadInteger('BASE', 'PosX', 0);
    BaseClass[cBase].PosY := jFile.ReadInteger('BASE', 'PosY', 0);
    BaseClass[cBase].GemX := jFile.ReadInteger('BASE', 'GemX', 0);
    BaseClass[cBase].GemY := jFile.ReadInteger('BASE', 'GemY', 0);

    LogDB.DBLog(Log, FileBaseStatus + ':', 0);
    LogDB.DBLog(Log,
      '.......................................................................'
      + '............................................................OK!!!', 0);
    Result := True;
  except
    on E: Exception do
    begin
      LogDB.DBLog(Log, E.Message, 1);
      LogDB.DBLog(Log, FileBaseStatus +
        '...........................................................Falha.', 1);
      Result := False;
    end;
  end;
  jFile.Free;
end;

procedure TLoadConfig.LoadFiles(Log: TRichEdit);
begin
  LoadConection(Log);
  LoadLangDB(Log);
  LoadBaseStatus(Log);
end;

destructor TLoadConfig.Destroy;
Var
  I: Integer;
begin

  JsonConection.Free;
  JsonLangDB.Free;
  LogDB.Free;
  for I := 0 to cBase do
  begin
    BaseClass[I].Free;
  end;
  inherited;
end;

end.
