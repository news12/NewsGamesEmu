unit OpCode.Base;

interface

Type
  OpCodeBase = class
  Private

  Public
    Class procedure PacketControl(ClientI: Word; OpCode: Word; size: Word);
  end;

implementation

class procedure OpCodeBase.PacketControl(ClientI: Word; OpCode: Word;
  size: Word);
begin
  //
end;

end.
