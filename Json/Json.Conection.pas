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
    FPORTA_SERVER: Integer;
    FIPSERVER: String;
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

    property PORTA_SERVER: Integer read FPORTA_SERVER write FPORTA_SERVER;

    property IPSERVER: String read FIPSERVER write FIPSERVER;

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
