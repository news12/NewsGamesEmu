unit Base.Def;

interface

Uses
  System.SysUtils, Vcl.Forms;

{$REGION '-># Header'}

type
  sHeader = Record
    Size: Word;
    Key: Byte;
    ChkSum: Byte;
    Code: Word;
    Index: Word;
    Time: LongWord;
  end;
{$ENDREGION}
{$REGION '-># 20D - Login : Tentativa'}

type
  p20D = Record
    Header: sHeader;
    Pass: array [0 .. 9] of Byte;
    Inu: Word;
    ID: array [0 .. 11] of Byte;
  End;
{$ENDREGION}
{$REGION '-># Header DB'}

Type
  sHeaderDB = Record
    cod: Word;
    clientid: Word;
  end;
{$ENDREGION}
{$REGION '-># solicita��o de login'}

Type
  p20DDB = Record
    Header: sHeaderDB;
    Pass: array [0 .. 9] of Byte;
    ID: array [0 .. 11] of Byte;
  end;
{$ENDREGION}
{$REGION '-># Cliente Online'}

type
  ClientOn = Record
    Handle: Cardinal;
    Conect: Word;
    ActiveChar: Byte;
    StatusChar: Word;
    // Mapa que o jogador esta | 0 Numerica 1 Charlist 2 Kersef
    // SubCharStatus : byte;
    CharSpawn: array [0 .. 65000] of Boolean; // Outro personagem em seu visual
    // Group: tGroup; // Diz quem � o lider e membros do grupo
    LastPM: Array [0 .. 11] of Byte; // Nome de quem mandou o ultimo pm

    LastHeader: sHeader;
    // checa se o ultimo head � igual, se for, deixa conta em analise
    Summon: Word;
    // Skill teleporte FM usa esse para ver se pode teleportar
    Invisible: Byte; // Registra se tem invisibilidade da HT
    BlockAntSpeed: Byte; // conta quantos atks em 1 segundos, 10 atk = DC
  End;
{$ENDREGION}
{$REGION '# ITEM '}

type
  sItem = Record
    Index: Word;
    EF1, EFV1: Byte;
    EF2, EFV2: Byte;
    EF3, EFV3: Byte;
  end;
{$ENDREGION}
{$REGION '# sQuest - Diarias/unicas'}

type
  sQuest = Record
    CristalArch: Byte; // Dia de conclus�o
    Pill: Byte; // Dia de conclus�o
    ChanceComp: Boolean;
    BalanceComp: Boolean;
    Amulets: Boolean;
    Molar: Boolean;
    Cube: Byte; // Dia de conclus�o
    CrazyLetter: Byte; // Dia de conclus�o
    CrazyMail: Byte; // Dia de conclus�o
    aDefine: array [0 .. 500] of Byte; // 501 bytes para criar miss�es depois
  End;
{$ENDREGION}
{$REGION '# sMissao - Contador de mobs para uma miss�o especifica'}

type
  sQuest2 = Record
    QuestID: Word;
    Amount: Byte;
  End;
{$ENDREGION}
{$REGION '# BaseStatus '}

type
  sStatusBase = Record
    Str, Int: Word;
    Dex, Con: Word;
    wMaster: Word;
    fMaster: Word;
    sMaster: Word;
    tMaster: Word;
  End;
{$ENDREGION}
{$REGION '# sStatus '}

type
  sStatus = Record // 48
    Level: Cardinal;
    Defence: Cardinal;
    Attack: Cardinal;
    Merchant: Byte;
    Speed: Byte;
    Inu1: Byte;
    Inu2: Byte;
    MaxHP, MaxMP: Cardinal; // integer
    HP, MP: Cardinal; // integer
    Str, Int: Word; // smallint
    Dex, Con: Word; // smallint
    wMaster: Word;
    fMaster: Word;
    sMaster: Word;
    tMaster: Word;
  End;
{$ENDREGION}
{$REGION '# sPontos - pontos para add no sStatus / Habilidades / Comprar Skill'}

type
  sPoint = Record
    Abiliity: Word; // smallint
    Learning: Word;
    Skill: Word; // smallint
  End;
{$ENDREGION}
{$REGION '# sResistencia - Resist�ncias dos personagens'}

type
  sResistance = Record
    Fire: Byte;
    Ice: Byte;
    Sacred: Byte;
    Thunder: Byte;
  End;
{$ENDREGION}
{$REGION ' Buffs e Debuffs'}

Type
  sBuffsControl = Record
    ID: Word;
    Amount: Word;
    Time: Cardinal;
  End;

  // cBuffs Buffs que ficam na estrutura do jogador
Type
  sBuffs = Record
    ID: Word;
    Amount: Word;
    Time: Cardinal;
  End;
{$ENDREGION}
{$REGION '# Personagem'}

type
  sCharacter = Record
    Name: array [0 .. 11] of Byte; // 12 caracteres
    Status: sStatus;
    bStatus: sStatusBase;
    _Class: Byte; // 0~3
    PosX: Word;
    PosY: Word;
    GemX: Word;
    GemY: Word;
    Point: sPoint; // Pontos para add habilidades
    Critical: Byte; // 1 = 0.4% -  255 = 102%
    skillbar1to4: Array [0 .. 3] of Byte; // 4
    SkillBar5to20: array [4 .. 19] of Byte; // 16 - ok
    MagicAttack: Word; // 1 - ok
    Resistence: sResistance; // 4 - ok
    Equip: Array [0 .. 15] of sItem;
    EquipColor: array [0 .. 15] of Byte;
    Bag: Array [0 .. 62] of sItem;
    Gold: Cardinal; // integer
    Exp: Cardinal; // Int 64
    GuildIndex: Word;
    Learn: Cardinal;
    Learn2: Cardinal;
    Cp: Byte; // 0 Pisca em vermelho | 1 - 30 PK |  36.000 = 1
    SecondsPK: Word;
    aAbs: Word;
    aPerfu: Word;
    aExp: Word;
    aDrop: Word;
    DailyQuest: sQuest;
    Quest: sQuest2;
    TimeBoxExp: Word;
    Tab: Array [0 .. 19] of Byte;
    Range: Byte;
    Buffs: Array [0 .. 31] of sBuffs;
    City: Byte;
    SkillReceived: Array [0 .. 42] of Byte;
  end;
{$ENDREGION}
{$REGION '# Jogador'}

Type
  sPlayer = Record
    ID_ACC: Cardinal;
    User: String[12];
    Pass: String[32];
    Numeric: String[6];
    NumericError: Byte; // errar 3 numericas = conta em restauro
    Online: Byte;
    // 0 offline 1 e 2 Errou senha 3 Bloqueio efetuado  4 online  5 Analise  6 banida  7 Precisa Restaurar
    Bank: array [0 .. 119] of sItem;
    BankGold: Cardinal;
    Character: Array [0 .. 3] of sCharacter;
  End;

Type
  sPlayerDB = Record
    ID_ACC: Cardinal;
    User: String[12];
    Pass: String[32];
    Numeric: String[6];
    NumericError: Byte; // errar 3 numericas = conta em restauro
    Online: Byte;
    // 0 offline 1 e 2 Errou senha 3 Bloqueio efetuado  4 online  5 Analise  6 banida  7 Precisa Restaurar
    Bank: array [0 .. 119] of sItem;
    BankGold: Cardinal;
    Character: Array [0 .. 3] of sCharacter;
  End;
{$ENDREGION}
{$REGION '# Envia a conta aos canais'}

Type
  sLoadedAcc = Record
    Header: sHeaderDB;
    Player: sPlayer;
  end;
{$ENDREGION}
{$REGION '# solicita��o create char'}

Type
  p20FDB = Record
    Header: sHeaderDB;
    char: Cardinal;
    Name: array [0 .. 11] of Byte;
    _Class: Byte;
  end;
{$ENDREGION}
{$REGION '# 10A - Login : Charlist'}

type
  p10A = Record
    Header: sHeader; // 12
    Inu1: array [0 .. 19] of Byte; // 20 bytes at� entao random
    PosX: array [0 .. 3] of Word; // Pos X
    PosY: array [0 .. 3] of Word; // Pos Y
    Name: array [0 .. 3] of array [0 .. 15] of Byte; // Nomes
    Status: array [0 .. 3] of sStatus; // Status
    Equip: array [0 .. 3] of array [0 .. 15] of sItem; // Equipamentos
    GuildIndex: array [0 .. 3] of Word; // Cl�
    Gold: array [0 .. 3] of Cardinal; // Gold
    Exp: array [0 .. 3] of Cardinal; // test exp
    Inu2: array [0 .. 3] of Cardinal; // inutil
    Bank: array [0 .. 119] of sItem; //
  End;
{$ENDREGION}
{$REGION '# 110 - CharCreat'}

type
  p110 = Record
    Header: sHeader; // 12
    Inu1: Cardinal; //
    PosX: array [0 .. 3] of Word; // 8
    PosY: array [0 .. 3] of Word; // 8
    Name: array [0 .. 3] of array [0 .. 15] of Byte; // 64
    Status: array [0 .. 3] of sStatus; // 112
    Equipe: array [0 .. 3] of array [0 .. 15] of sItem; // 512
    GuildIndex: array [0 .. 3] of Word; // 8
    Gold: array [0 .. 3] of Cardinal; // 16
    Exp: array [0 .. 3] of Cardinal; // 32
    Inu2: array [0 .. 3] of Cardinal; // inutil
  End;
{$ENDREGION}
{$REGION '# 101 - Mensagem'}

type
  p101 = Record
    Header: sHeader;
    menssagem: String[95];
  End;
{$ENDREGION}
{$REGION '# Guarda a num�rica vinda do Mysql para enviar ao canal'}

Type
  sPlayerBase = Record
    User: String[12];
    Numeric: String[6];
    NumericError: Byte; // errar 3 numericas = reset senha
    Online: Byte;
    // 0 offline 1 e 2 Errou senha 3 Bloqueio efetuado  4 online  5 Analise  6 banida  7 Precisa Restaurar
  end;
{$ENDREGION}
{$REGION '# FDE - Numerica'}

Type
  pFDE = Record
    Header: sHeader;
    Pass: Array [0 .. 5] of Byte;
  End;
{$ENDREGION}
{$REGION '# 20F - CharList : Solicita Create Char'}

type
  p20F = Record
    Header: sHeader;
    char: Cardinal;
    Name: array [0 .. 11] of Byte;
    inutil: integer; // char so pode ter 12 caracteres
    _Class: Byte;
  End;
{$ENDREGION}
{$REGION '# Recebe as contas dos canais para salvar'}

Type
  sAccountSave = Record
    Header: sHeaderDB;
    StatusOnline: Byte;
    NumericError: Byte;
    Player: sPlayer;
  end;
{$ENDREGION}
{$REGION '# 213 - RequestSend To World'}

type
  p213 = Record
    Header: sHeader; // 12
    Character: Cardinal; // 4
  End;
{$ENDREGION}
{$REGION '# [X] MOB' }

Type
  sCoord = Record
    PosX, PosY: Word;
  End;

Type
  sTarget = Record
    AttackReceive: Boolean;
    Damage: Array [1 .. 1999] of Word;
  End;

type
  sSkill = Record
    Skill: Word;
    Area: Byte;
  End;

Type
  sMob = Record
    Header: sHeader; // 12 index = clientid
    PosX: Word;
    PosY: Word;
    Index: Word;
    Name: array [0 .. 15] of Byte;
    Equip: array [0 .. 15] of Word;
    Buffs: Array [0 .. 31] of Word;
    GuildIndex: Word;
    Inu1: Cardinal;
    Status: sStatus;
    SpawnType: Word;
    // 2 : 0 - normal 2 - Nascendo  3- Teleportando  16- pos1 32 - post2
    EquipColor: array [0 .. 15] of Byte; // 16
    Tab: array [0 .. 25] of Byte; // 26
    Inu2: Cardinal;
    // Fim do pacote 364 Spanw
    Generate: Cardinal; // segundos para nascer - 0 nao nasce automatico
    Npc: Boolean; // NPC ou mOB
    MovementType: Byte; // byte  fixo aleatorio seguir predefinido
    MovementInfo: Word;
    // aleatorio=quantos pontos mover   seguir=id para ir atraz   pre-definido=qual dos movimentos
    Route: Array [0 .. 5] of sCoord;
    Target: sTarget; // alvos que estao atacando e seus danos
    Perfu: Word;
    Abs: Word;
    DropList: Word;
    Resistence: Byte; // 4 - ok
    Skills: Array [0 .. 9] of sSkill;
  End;
{$ENDREGION}
{$REGION '# 165 - MobDelete'}

Type
  p165 = Record
    Header: sHeader; // index alvo
    _Type: Cardinal; //
    {
      0 - desaparece
      1 - a��o morto
      2 - luz azul e some em 5s
      3++ - teleport amarelo
    }
  End;
{$ENDREGION}
{$REGION '# [X] Itemlist'}

type
  sItemList = Record
    Name: String[65];
    Level: Word;
    Str: Word;
    Int: Word;
    Dex: Word;
    Con: Word;
    Price: Cardinal;
    Position: Word;
    Grade: Byte;
    Add: Array [0 .. 110] of Word;
  end;
{$ENDREGION}

{$REGION '# Log DB'}
Type
  sLogDB = Record
    Header: sHeaderDB;
    MSG: String[250];
  end;
{$ENDREGION}
implementation

end.

