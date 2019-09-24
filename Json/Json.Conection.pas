unit Json.Conection;

interface

Uses
  System.SysUtils, Vcl.Forms;

type

  TjsonConect = class
  private
    { private declarations }
    FIP: String;
    FDB: String;
    FUSER: String;
    FSENHA: String;
    FPORTA_MYSQL: Integer;
    FPORTA_CHANNEL1: Integer;
    FPORTA_CHANNEL2: Integer;
    FPORTA_CHANNEL3: Integer;
    FPORTA_CHANNEL4: Integer;
    FPORTA_CHANNEL5: Integer;
    FIP_CHANNEL1: String;
    FIP_CHANNEL2: String;
    FIP_CHANNEL3: String;
    FIP_CHANNEL4: String;
    FIP_CHANNEL5: String;
    FMAXCHANNEL: Integer;
  protected
    { protected declarations }
  public
    { public declarations }
    ConfigFolder: String;
    LangFolder: String;
    FolderGame: String;

    Constructor Create; // declaração do metodo construtor

    property IP: String read FIP write FIP;

    property DB: String read FDB write FDB;

    property USER: String read FUSER write FUSER;

    property SENHA: String read FSENHA write FSENHA;

    property PORTA_MYSQL: Integer read FPORTA_MYSQL write FPORTA_MYSQL;

    property MAXCHANNEL: Integer read FMAXCHANNEL write FMAXCHANNEL;

    property PORTA_CHANNEL1: Integer read FPORTA_CHANNEL1 write FPORTA_CHANNEL1;

    property PORTA_CHANNEL2: Integer read FPORTA_CHANNEL2 write FPORTA_CHANNEL2;

    property PORTA_CHANNEL3: Integer read FPORTA_CHANNEL3 write FPORTA_CHANNEL3;

    property PORTA_CHANNEL4: Integer read FPORTA_CHANNEL4 write FPORTA_CHANNEL4;

    property PORTA_CHANNEL5: Integer read FPORTA_CHANNEL5 write FPORTA_CHANNEL5;

    property IP_CHANNEL1: String read FIP_CHANNEL1 write FIP_CHANNEL1;

    property IP_CHANNEL2: String read FIP_CHANNEL2 write FIP_CHANNEL2;

    property IP_CHANNEL3: String read FIP_CHANNEL3 write FIP_CHANNEL3;

    property IP_CHANNEL4: String read FIP_CHANNEL4 write FIP_CHANNEL4;

    property IP_CHANNEL5: String read FIP_CHANNEL5 write FIP_CHANNEL5;

    Destructor Destroy; Override; // declaração do metodo destrutor

  end;

implementation

{ TjsonRead }

constructor TjsonConect.Create;
begin
  ConfigFolder := ExtractFilePath(Application.ExeName) + 'Config\';
  LangFolder := ExtractFilePath(Application.ExeName) + 'Lang\';
  FolderGame := ExtractFilePath(Application.ExeName);
end;

destructor TjsonConect.Destroy;
begin

  inherited;

  ConfigFolder := '';
  LangFolder := '';
end;

end.
