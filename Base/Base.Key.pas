unit Base.Key;

{ ##########################################
  EncDec base do Emulador HB

  ############################################# }
interface

procedure Encode(Len: Word);
function Decode(Len: Word): boolean;

implementation

Uses
  Base.Struct,
  MMSystem,
  windows,
  SysUtils;

var
  EncDecKeys: array [0 .. 511] of Byte = (
    $84,
    $87,
    $37,
    $D7,
    $EA,
    $79,
    $91,
    $7D,
    $4B,
    $4B,
    $85,
    $7D,
    $87,
    $81,
    $91,
    $7C,
    $0F,
    $73,
    $91,
    $91,
    $87,
    $7D,
    $0D,
    $7D,
    $86,
    $8F,
    $73,
    $0F,
    $E1,
    $DD,
    $85,
    $7D,
    $05,
    $7D,
    $85,
    $83,
    $87,
    $9C,
    $85,
    $33,
    $0D,
    $E2,
    $87,
    $19,
    $0F,
    $79,
    $85,
    $86,
    $37,
    $7D,
    $D7,
    $DD,
    $E9,
    $7D,
    $D7,
    $7D,
    $85,
    $79,
    $05,
    $7D,
    $0F,
    $E1,
    $87,
    $7E,
    $23,
    $87,
    $F5,
    $79,
    $5F,
    $E3,
    $4B,
    $83,
    $A3,
    $A2,
    $AE,
    $0E,
    $14,
    $7D,
    $DE,
    $7E,
    $85,
    $7A,
    $85,
    $AF,
    $CD,
    $7D,
    $87,
    $A5,
    $87,
    $7D,
    $E1,
    $7D,
    $88,
    $7D,
    $15,
    $91,
    $23,
    $7D,
    $87,
    $7C,
    $0D,
    $7A,
    $85,
    $87,
    $17,
    $7C,
    $85,
    $7D,
    $AC,
    $80,
    $BB,
    $79,
    $84,
    $9B,
    $5B,
    $A5,
    $D7,
    $8F,
    $05,
    $0F,
    $85,
    $7E,
    $85,
    $80,
    $85,
    $98,
    $F5,
    $9D,
    $A3,
    $1A,
    $0D,
    $19,
    $87,
    $7C,
    $85,
    $7D,
    $84,
    $7D,
    $85,
    $7E,
    $E7,
    $97,
    $0D,
    $0F,
    $85,
    $7B,
    $EA,
    $7D,
    $AD,
    $80,
    $AD,
    $7D,
    $B7,
    $AF,
    $0D,
    $7D,
    $E9,
    $3D,
    $85,
    $7D,
    $87,
    $B7,
    $23,
    $7D,
    $E7,
    $B7,
    $A3,
    $0C,
    $87,
    $7E,
    $85,
    $A5,
    $7D,
    $76,
    $35,
    $B9,
    $0D,
    $6F,
    $23,
    $7D,
    $87,
    $9B,
    $85,
    $0C,
    $E1,
    $A1,
    $0D,
    $7F,
    $87,
    $7D,
    $84,
    $7A,
    $84,
    $7B,
    $E1,
    $86,
    $E8,
    $6F,
    $D1,
    $79,
    $85,
    $19,
    $53,
    $95,
    $C3,
    $47,
    $19,
    $7D,
    $E7,
    $0C,
    $37,
    $7C,
    $23,
    $7D,
    $85,
    $7D,
    $4B,
    $79,
    $21,
    $A5,
    $87,
    $7D,
    $19,
    $7D,
    $0D,
    $7D,
    $15,
    $91,
    $23,
    $7D,
    $87,
    $7C,
    $85,
    $7A,
    $85,
    $AF,
    $CD,
    $7D,
    $87,
    $7D,
    $E9,
    $3D,
    $85,
    $7D,
    $15,
    $79,
    $85,
    $7D,
    $C1,
    $7B,
    $EA,
    $7D,
    $B7,
    $7D,
    $85,
    $7D,
    $85,
    $7D,
    $0D,
    $7D,
    $E9,
    $73,
    $85,
    $79,
    $05,
    $7D,
    $D7,
    $7D,
    $85,
    $E1,
    $B9,
    $E1,
    $0F,
    $65,
    $85,
    $86,
    $2D,
    $7D,
    $D7,
    $DD,
    $A3,
    $8E,
    $E6,
    $7D,
    $DE,
    $7E,
    $AE,
    $0E,
    $0F,
    $E1,
    $89,
    $7E,
    $23,
    $7D,
    $F5,
    $79,
    $23,
    $E1,
    $4B,
    $83,
    $0C,
    $0F,
    $85,
    $7B,
    $85,
    $7E,
    $8F,
    $80,
    $85,
    $98,
    $F5,
    $7A,
    $85,
    $1A,
    $0D,
    $E1,
    $0F,
    $7C,
    $89,
    $0C,
    $85,
    $0B,
    $23,
    $69,
    $87,
    $7B,
    $23,
    $0C,
    $1F,
    $B7,
    $21,
    $7A,
    $88,
    $7E,
    $8F,
    $A5,
    $7D,
    $80,
    $B7,
    $B9,
    $18,
    $BF,
    $4B,
    $19,
    $85,
    $A5,
    $91,
    $80,
    $87,
    $81,
    $87,
    $7C,
    $0F,
    $73,
    $91,
    $91,
    $84,
    $87,
    $37,
    $D7,
    $86,
    $79,
    $E1,
    $DD,
    $85,
    $7A,
    $73,
    $9B,
    $05,
    $7D,
    $0D,
    $83,
    $87,
    $9C,
    $85,
    $33,
    $87,
    $7D,
    $85,
    $0F,
    $87,
    $7D,
    $0D,
    $7D,
    $F6,
    $7E,
    $87,
    $7D,
    $88,
    $19,
    $89,
    $F5,
    $D1,
    $DD,
    $85,
    $7D,
    $8B,
    $C3,
    $EA,
    $7A,
    $D7,
    $B0,
    $0D,
    $7D,
    $87,
    $A5,
    $87,
    $7C,
    $73,
    $7E,
    $7D,
    $86,
    $87,
    $23,
    $85,
    $10,
    $D7,
    $DF,
    $ED,
    $A5,
    $E1,
    $7A,
    $85,
    $23,
    $EA,
    $7E,
    $85,
    $98,
    $AD,
    $79,
    $86,
    $7D,
    $85,
    $7D,
    $D7,
    $7D,
    $E1,
    $7A,
    $F5,
    $7D,
    $85,
    $B0,
    $2B,
    $37,
    $E1,
    $7A,
    $87,
    $79,
    $84,
    $7D,
    $73,
    $73,
    $87,
    $7D,
    $23,
    $7D,
    $E9,
    $7D,
    $85,
    $7E,
    $02,
    $7D,
    $DD,
    $2D,
    $87,
    $79,
    $E7,
    $79,
    $AD,
    $7C,
    $23,
    $DA,
    $87,
    $0D,
    $0D,
    $7B,
    $E7,
    $79,
    $9B,
    $7D,
    $D7,
    $8F,
    $05,
    $7D,
    $0D,
    $34,
    $8F,
    $7D,
    $AD,
    $87,
    $E9,
    $7C,
    $85,
    $80,
    $85,
    $79,
    $8A,
    $C3,
    $E7,
    $A5,
    $E8,
    $6B,
    $0D,
    $74,
    $10,
    $73,
    $33,
    $17,
    $0D,
    $37,
    $21,
    $19
  );

procedure Encode(Len: Word);
var
  i: Cardinal;
  pos, Key, rand_key: integer;
  sum1, sum2: integer;
begin
  zeromemory(@sEnv, sizeof(sEnv));
  sum1 := 0;
  sum2 := 0;
  Randomize;
  rand_key := Random(255);
  sEnv[0] := WordRec(Len).Lo;
  sEnv[1] := WordRec(Len).Hi;
  sEnv[2] := rand_key;
  sEnv[3] := 0;
  SDec[8] := timegettime;

  pos := EncDecKeys[rand_key * 2];
  i := 4;

  while (i < Len) do
  begin
    Key := EncDecKeys[((pos and $FF) * 2) + 1];
    case (i and 3) of
      0:
        begin
          Key := Key * 2;
          Key := Key and 255;
          sEnv[i] := SDec[i] + Key;
        end;
      1:
        begin
          Key := Key shr 3;
          Key := Key and 255;
          sEnv[i] := SDec[i] - Key;
        end;
      2:
        begin
          Key := Key * 4;
          Key := Key and 255;
          sEnv[i] := SDec[i] + Key;
        end;
      3:
        begin
          Key := Key shr 5;
          Key := Key and 255;
          sEnv[i] := SDec[i] - Key;
        end;
    else
      begin
        Key := Key shr 5;
        Key := Key and 255;
        sEnv[i] := SDec[i] - Key;
      end;
    end;
    sum1 := sum1 + SDec[i];
    sum2 := sum2 + sEnv[i];
    inc(pos, 1);
    inc(i, 1);
  end;
  sum1 := sum1 and $FF;
  sum2 := sum2 and $FF;
  sEnv[3] := ((sum2 - sum1) and 255);
  zeromemory(@SDec, sizeof(SDec));
end;

function Decode(Len: Word): boolean;
var
  i: Cardinal;
  pos, Key: integer;
  sum1, sum2: integer;
begin
  sum1 := 0;
  sum2 := 0;

  pos := EncDecKeys[SRec[2] * 2];
  i := 4;

  while (i < Len) do
  begin

    sum1 := sum1 + SRec[i];
    Key := EncDecKeys[((pos and $FF) * 2) + 1];

    case (i and 3) of
      0:
        begin
          Key := Key shl 1;
          Key := Key and 255;
          SRec[i] := SRec[i] - Key;
        end;
      1:
        begin
          Key := Key shr 3;
          Key := Key and 255;
          SRec[i] := SRec[i] + Key;
        end;
      2:
        begin
          Key := Key shl 2;
          Key := Key and 255;
          SRec[i] := SRec[i] - Key;
        end;
      3:
        begin
          Key := Key shr 5;
          Key := Key and 255;
          SRec[i] := SRec[i] + Key;
        end;
    else
      begin
        Key := Key shr 5;
        Key := Key and 255;
        SRec[i] := SRec[i] + Key;
      end;
    end;

    sum2 := sum2 + SRec[i];
    inc(pos, 1);
    inc(i, 1);
  end;
  sum1 := sum1 and 255;
  sum2 := sum2 and 255;
  Move(SRec, SDec, sizeof(SRec));
  if SRec[3] <> ((sum2 - sum1) and 255) then
    result := false
  else
    result := true;
end;

end.
