unit Json.Status;

interface

type

  TJsonStatus = class
  private
    { private declarations }
    Fstr: Word;
    Fint: Word;
    Fdex: Word;
    FCon: Word;
    FHP: Word;
    FMP: Word;
    FPosX: Word;
    FPosY: Word;
    FGemX: Word;
    FGemY: Word;
    FwMaster: Word;
    FfMaster: Word;
    FsMaster: Word;
    FtMaster: Word;
  protected
    { protected declarations }
  public
    { public declarations }
    Constructor Create; // declaração do metodo construtor

    property _Str: Word read Fstr write Fstr;

    property Int: Word read Fint write Fint;

    property Dex: Word read Fdex write Fdex;

    property Con: Word read FCon write FCon;

    property HP: Word read FHP write FHP;

    property MP: Word read FMP write FMP;

    property PosX: Word read FPosX write FPosX;

    property PosY: Word read FPosY write FPosY;

    property GemX: Word read FGemX write FGemX;

    property GemY: Word read FGemY write FGemY;

    property wMaster: Word read FwMaster write FwMaster;

    property fMaster: Word read FfMaster write FfMaster;

    property sMaster: Word read FsMaster write FsMaster;

    property tMaster: Word read FtMaster write FtMaster;

    Destructor Destroy; Override; // declaração do metodo destrutor

  end;

implementation

{ TStatusBase }

constructor TJsonStatus.Create;
begin

end;

destructor TJsonStatus.Destroy;
begin

  inherited;
end;

end.
