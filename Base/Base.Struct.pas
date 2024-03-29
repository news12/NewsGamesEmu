unit Base.Struct;

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
  System.Win.ScktComp,
  Log.DB,
  Base.Def,
  _Function.BAN,
  _Function.DC,
  _Function.Notice,
  _Function.Numeric,
  Packet.Main,
  Account.Base;

Var
  sChannel: Array of TServerSocket;
 // nChannel1 : TServerSocket;
  MaxChannel: Word;
  // Conexao
  CountDisconect: Integer;
  SRec, SDec, SEnv: Array [0 .. 2000] of Byte;
  // Buffer recebido,decodificado,enviado
  SEnvDB: Array [0 .. 10000] of Byte; // Buffer tratado do DB
  // Estruturas
  Client: Array [0 .. 900] of ClientOn;
  // Estrutura de conexao dos clientes  0 indiferente
  GuildCity: Array [0 .. 3] of Word; // Lideres das cidades [guild]
  GuildName: Array [0 .. 60000] of String[19]; // Nome das guilds
  Player: Array [0 .. 900] of sPlayer;
  // Estrutura dos jogadores   0 indiferente
  // Save: sSalvarConta; // Guarda a estrutura do jogador para salvar na DB
  MOB: Array [0 .. 65000] of sMOB; // Estrutura MOB Padrao  0 indiferente
  // MOBBase: Array [3001 .. 14999] of sMOB;
  // Estrutura que carrega o MOB inicialmente
  RespawMOB: Array [3001 .. 14999] of TDateTime;
  // Guarda a hora de nascimento dos mobs
  // Reward: Array [0 .. 10000] of sRecompensas; // Armazena as recompensas
  // Drop: Array [0 .. 10000] of sDrop; // Armazena os items e % de drop
  MovimentNext: Array [1001 .. 65001] of TDateTime;
  // armazena proximos movimentos
  ItemList: array [0 .. 7000] of sItemList; // Estrutura item
  // Mercado: Array [0 .. 1000] of sMercados; // Estrutura mercados
  Buffs: Array [0 .. 65000] of Array [0 .. 31] of sBuffsControl;
  // Estrutura dos buffs dos mobs   0 indiferente
  // SkillData: Array [0 .. 3] of Array [0 .. 23] of sSkillData;
  // Estrutura SkillData
  // Quiz: sQuiz; // Estrutura do quiz
  // Variaveis
  MaxPlayer: Word; // Guarda o numero maximo de ClientID
  ListCMD: TstringList; // Guarda os comandos e chats do jogo
  PlayerChat: TstringList; // Guarda todos os chats dos jogadores
  PacketLast: TstringList; // Guarda os comandos e chats do jogo
  SvClose: Boolean; // se verdadeiro ng mais conecta
  DropBaseDefault: Byte;
  DropBasebonus: Byte;
  // Variaveis que s�o usadas em eventos
  DoubleExp: Byte;
  DoubleDrop: Byte;
  logStr: String;
  cFile: string;
  jFile: TJsonFile;
  JsonConection: TjsonConect;
  JsonLangDB: tJsonLangDB;
  LogDB: Tlog;
  BaseStatus: TJsonStatus;
  SvClosed: Boolean;
  BAN: TFunctionBAN;
  DC: TFunctionDC;
  Notice: TFunctionNotice;
  Numeric: TFunctionNumeric;
  PacketMain: TPacketMain;
  LoginDB: TAccount;

Type
  ArrayName = array of Byte;

Type
  ArrayBag = Array of sItem;

Const
  TK: Word = 0;
  FM: Word = 1;
  BM: Word = 2;
  HT: Word = 3;
  cBase: Word = 4;
  MaxSLotBag: Word = 63; // 0 a 62
{$REGION 'Timer milliseconds'}
  OneSec: Integer = 1000;
  FiveSec: Integer = 5000;
  ThirtySec: Integer = 30000;
  OneMin: Integer = 60000;
  FiveMin: Integer = 300000;
  TenMin: Integer = 600000;
  ThirtyMin: Integer = 1800000;
  OneHour: Integer = 3600000;
{$ENDREGION}
{$REGION 'Arquivos Json'}
  FileConexao: String = 'Config\Conexao.json';
  FileLangDB: String = 'Lang\LangDB.json';
  FileBaseStatus: String = 'Character\BaseStatus.json';
{$ENDREGION}
{$REGION 'Tabelas do Banco de Dados'}
  TableLog: String = 'Log';
  TableAccount: String = 'Account';
  TableCharacter: String = 'ncharacter';
  TableCharacterStatus: String = 'ncharacter_status';
  TableCharacterBag: String = 'ncharacter_bag';
{$ENDREGION}

implementation

end.
