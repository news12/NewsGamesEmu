unit Character.Status;

interface

Uses
  System.SysUtils,
  Base.Def,
  Base.Struct,
  Thread.Main,
  FireDAC.Comp.Client;

Type
  tCharacterStatus = Class
  Private
    { Private class }
    FId_Character: Integer;
    FLevel: Cardinal;
    FDefence: Cardinal;
    FAttack: Cardinal;
    FMerchant: Byte;
    FSpeed: Byte;
    FInu1: Byte;
    FInu2: Byte;
    FMaxHP: Cardinal;
    FMaxMP: Cardinal; // integer
    FHP: Cardinal;
    FMP: Cardinal; // integer
    FStr: Word;
    FInt: Word; // smallint
    FDex: Word;
    FCon: Word; // smallint
    FwMaster: Word;
    FfMaster: Word;
    FsMaster: Word;
    FtMaster: Word;
  Public
    { Public class }
    property Id_Character: Integer read FId_Character write FId_Character;
    property Level: Cardinal read FLevel write FLevel;
    property Defence: Cardinal read FDefence write FDefence;
    property Attack: Cardinal read FAttack write FAttack;
    property Merchant: Byte read FMerchant write FMerchant;
    property Speed: Byte read FSpeed write FSpeed;
    property Inu1: Byte read FInu1 write FInu1;
    property Inu2: Byte read FInu2 write FInu2;
    property MaxHP: Cardinal read FMaxHP write FMaxHP;
    property MaxMP: Cardinal read FMaxMP write FMaxMP;
    property HP: Cardinal read FHP write FHP;
    property MP: Cardinal read FMP write FMP;
    property Str: Word read FStr write FStr;
    property Int: Word read FInt write FInt;
    property Dex: Word read FDex write FDex;
    property Con: Word read FCon write FCon;
    property wMaster: Word read FwMaster write FwMaster;
    property fMaster: Word read FfMaster write FfMaster;
    property sMaster: Word read FsMaster write FsMaster;
    property tMaster: Word read FtMaster write FtMaster;

    class function CreatCharacterStatus(Player: sPlayer; CharID: Word): Boolean;

    class function LoadCharacterStatus(CharID: Word): sPlayer;

  End;

implementation

class function tCharacterStatus.LoadCharacterStatus(CharID: Word): sPlayer;
var
  qStatus: TFDQuery;
  sSQL: String;
  id_Slot: Word;
begin
  sSQL := 'WHERE id_character=' + IntToStr(CharID);
  qStatus := FunctionBase.SelectTable(TableCharacterStatus, '*', '', sSQL);
end;

class function tCharacterStatus.CreatCharacterStatus(Player: sPlayer;
  CharID: Word): Boolean;
var
  qCharacter: TFDQuery;
  qStatus: TFDQuery;
  cSQL, sSQL: String;
begin
  cSQL := 'WHERE id_account=' + IntToStr(Player.ID_ACC) + ' AND character_Slot='
    + IntToStr(CharID);
  qCharacter := FunctionBase.SelectTable(TableCharacter, 'ID,Character_Slot', '', cSQL);
  if Not qCharacter.IsEmpty then
  begin
    sSQL := 'WHERE id_character=' + qCharacter.FieldByName('ID').AsString;
    qStatus := FunctionBase.SelectTable(TableCharacterStatus, '', '', sSQL);
    if qStatus.IsEmpty then
    begin
      With qStatus Do
      begin
        Try
          Insert;
          FieldByName('id_character').AsInteger := qCharacter.FieldByName('id')
            .AsInteger;
          FieldByName('level').AsInteger := 0;
          FieldByName('defence').AsInteger := 0;
          FieldByName('attack').AsInteger := 0;
          FieldByName('merchant').AsInteger := Player.Character[CharID]
            .Equip[0].Index;
          FieldByName('speed').AsInteger := 1;
          FieldByName('inu1').AsInteger := 0;
          FieldByName('inu2').AsInteger := 0;
          FieldByName('maxHP').AsInteger := 100;
          FieldByName('maxMP').AsInteger := 100;
          FieldByName('HP').AsInteger := 100;
          FieldByName('MP').AsInteger := 100;
          FieldByName('s_str').AsInteger := Player.Character[CharID]
            .bStatus.Str;
          FieldByName('s_int').AsInteger := Player.Character[CharID]
            .bStatus.Int;
          FieldByName('s_dex').AsInteger := Player.Character[CharID]
            .bStatus.Dex;
          FieldByName('s_con').AsInteger := Player.Character[CharID]
            .bStatus.Con;
          FieldByName('wMaster').AsInteger := Player.Character[CharID]
            .bStatus.wMaster;
          FieldByName('fMaster').AsInteger := Player.Character[CharID]
            .bStatus.fMaster;
          FieldByName('sMaster').AsInteger := Player.Character[CharID]
            .bStatus.sMaster;
          FieldByName('tMaster').AsInteger := Player.Character[CharID]
            .bStatus.tMaster;
          // FieldByName('character_slot').AsInteger := CharID; //desativado
          Post;
          Result := True
        Except
          On E: Exception do
          begin
            Result := False;
          end;
        End;
      end;
    end;
  end;
end;

end.
