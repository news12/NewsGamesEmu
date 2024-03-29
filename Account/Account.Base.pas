unit Account.Base;

interface

Uses
  System.SysUtils,
  Form.Modulo,
  Base.Color,
  Base.GetConexao,
  Base.cSQL,
  Base.Crypt,
  Base.Def,
  FireDAC.Comp.Client;

Type
  TAccount = Class
  private
    { classes privadas }
    Fid: String;
    Flogin: String;
    Fpass: String;
    Fpass2: String;
    Fpass3: String;
    Fname: String;
    Femail: String;
    Fstatus: Integer;
    Flogout: Integer;
    Fcash: Real;
    FnumericError: Integer;

  protected
    { classes protegidas }

  public
    { classes publicas }

    { Variaveis }
    qAccount: TFDQuery;

    { Procedures/Functions }
    Constructor Create;

    property Id: String read Fid write Fid;

    property Login: String read Flogin write Flogin;

    property Pass: String read Fpass write Fpass;

    property Pass2: String read Fpass2 write Fpass2;

    property Pass3: String read Fpass3 write Fpass3;

    property Name: String read Fname write Fname;

    property Email: String read Femail write Femail;

    property Status: Integer read Fstatus write Fstatus;

    property Logout: Integer read Flogout write Flogout;

    property Cash: Real read Fcash write Fcash;

    property NumericError: Integer read FnumericError write FnumericError;

    class function SaveAccount(Acc: sLoadedAcc): Boolean;

    Destructor Destroy;

  published
    { classes publicadas }

  End;

implementation

{ TAccount }
Uses
  Form.Main,
  Packet.DB,
  _Function.Base,
  Base.Struct,
  Thread.Main;

constructor TAccount.Create;
begin
  // instruções a criar obj
end;

class function TAccount.SaveAccount(Acc: sLoadedAcc): Boolean;
Var
  qAcc: TFDQuery;
  uSQL: String;
  X, Skill: Integer;
begin
  uSQL := 'WHERE ID =' + IntToStr(Acc.Header.clientid);
  qAcc := FunctionBase.SelectTable(TableAccount, '*', '', uSQL);
  if Not qAcc.IsEmpty then
  begin
    PlayerDB.ID_ACC := accPlayer.ID_ACC;
    PlayerDB.User := accPlayer.User;
    PlayerDB.Numeric := accPlayer.Numeric;
    PlayerDB.NumericError := accPlayer.NumericError;
    PlayerDB.Online := accPlayer.Online;
    move(accPlayer.Bank, PlayerDB.Bank, sizeof(PlayerDB.Bank));
    PlayerDB.BankGold := accPlayer.BankGold;
    for X := 0 to 3 do
    begin
      move(accPlayer.Character[X].Name, PlayerDB.Character[X].Name,
        sizeof(PlayerDB.Character[X].Name));
      move(accPlayer.Character[X].Status, PlayerDB.Character[X].Status,
        sizeof(PlayerDB.Character[X].Status));
      move(accPlayer.Character[X].bStatus, PlayerDB.Character[X].bStatus,
        sizeof(PlayerDB.Character[X].bStatus));
      move(accPlayer.Character[X]._Class, PlayerDB.Character[X]._Class,
        sizeof(PlayerDB.Character[X]._Class));
      move(accPlayer.Character[X].PosX, PlayerDB.Character[X].PosX,
        sizeof(PlayerDB.Character[X].PosX));
      move(accPlayer.Character[X].PosY, PlayerDB.Character[X].PosY,
        sizeof(PlayerDB.Character[X].PosY));
      move(accPlayer.Character[X].GemX, PlayerDB.Character[X].GemX,
        sizeof(PlayerDB.Character[X].GemX));
      move(accPlayer.Character[X].GemY, PlayerDB.Character[X].GemY,
        sizeof(PlayerDB.Character[X].GemY));
      move(accPlayer.Character[X].Point, PlayerDB.Character[X].Point,
        sizeof(PlayerDB.Character[X].Point));
      move(accPlayer.Character[X].skillbar1to4, PlayerDB.Character[X].skillbar1to4,
        sizeof(PlayerDB.Character[X].skillbar1to4));
      move(accPlayer.Character[X].SkillBar5to20,
        PlayerDB.Character[X].SkillBar5to20,
        sizeof(PlayerDB.Character[X].SkillBar5to20));
      move(accPlayer.Character[X].Equip, PlayerDB.Character[X].Equip,
        sizeof(PlayerDB.Character[X].Equip));
      move(accPlayer.Character[X].EquipColor, PlayerDB.Character[X].EquipColor,
        sizeof(PlayerDB.Character[X].EquipColor));
      move(accPlayer.Character[X].Bag, PlayerDB.Character[X].Bag,
        sizeof(PlayerDB.Character[X].Bag));
      move(accPlayer.Character[X].Gold, PlayerDB.Character[X].Gold,
        sizeof(PlayerDB.Character[X].Gold));
      move(accPlayer.Character[X].Exp, PlayerDB.Character[X].Exp,
        sizeof(PlayerDB.Character[X].Exp));
      move(accPlayer.Character[X].GuildIndex, PlayerDB.Character[X].GuildIndex,
        sizeof(PlayerDB.Character[X].GuildIndex));
      move(accPlayer.Character[X].Learn, PlayerDB.Character[X].Learn,
        sizeof(PlayerDB.Character[X].Learn));
      move(accPlayer.Character[X].Learn2, PlayerDB.Character[X].Learn2,
        sizeof(PlayerDB.Character[X].Learn2));
      move(accPlayer.Character[X].Cp, PlayerDB.Character[X].Cp,
        sizeof(PlayerDB.Character[X].Cp));
      move(accPlayer.Character[X].SecondsPK, PlayerDB.Character[X].SecondsPK,
        sizeof(PlayerDB.Character[X].SecondsPK));
      move(accPlayer.Character[X].DailyQuest, PlayerDB.Character[X].DailyQuest,
        sizeof(PlayerDB.Character[X].DailyQuest));
      move(accPlayer.Character[X].Quest, PlayerDB.Character[X].Quest,
        sizeof(PlayerDB.Character[X].Quest));

      for Skill := 0 to 31 do
      begin
        if accPlayer.Character[X].Buffs[Skill].Id = 39 then
        begin
          Inc(PlayerDB.Character[X].TimeBoxExp,
            accPlayer.Character[X].Buffs[Skill].Time);
        end;
      end;
      move(accPlayer.Character[X].City, PlayerDB.Character[X].City,
        sizeof(PlayerDB.Character[X].City));
      move(accPlayer.Character[X].SkillReceived,
        PlayerDB.Character[X].SkillReceived,
        sizeof(PlayerDB.Character[X].SkillReceived));
    end;
  end;
end;

destructor TAccount.Destroy;
begin
  // instruções ao destruir obj
end;

end.
