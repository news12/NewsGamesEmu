object DM: TDM
  OldCreateOrder = False
  Height = 410
  Width = 624
  object Connection: TFDConnection
    Params.Strings = (
      'Database=wyd_ng'
      'User_Name=root'
      'Password=123456'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 112
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 544
    Top = 344
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\uell1\OneDrive\'#193'rea de Trabalho\EmuladorWYD\NewsGames\S' +
      'ource\DLL\libmysql55.dll'
    Left = 352
    Top = 344
  end
end
