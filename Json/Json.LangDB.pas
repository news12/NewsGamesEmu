unit Json.LangDB;

interface

Uses
  System.SysUtils, Vcl.Forms;

{$REGION '#Lang Conexão com o DB'}

Type
  tJsonLangDB = Class
  Protected
    { Class Protected }

  Private
    { Class Private }
    fNotAccount: String;
    fNumericError: String;
    fLoggedIn: String;
    fBlocked: String;
    fBaned: String;
    fResetPass: String;
    fNotFound: String;
    fCharExists: String;
    fFollowingError: String;
  Public
    { Class Public }
    property NotAccount: String read fNotAccount write fNotAccount;
    property NumericError: String read fNumericError write fNumericError;
    property LoggedIn: String read fLoggedIn write fLoggedIn;
    property Blocked: String read fBlocked write fBlocked;
    property Baned: String read fBaned write fBaned;
    property ResetPass: String read fResetPass write fResetPass;
    property NotFound: String read fNotFound write fNotFound;
    property CharExists: String read fCharExists write fCharExists;
    property FollowingError: String read fFollowingError write fFollowingError;

    Constructor Create;

    Destructor Destroy; override;

  End;
{$ENDREGION}

implementation

Constructor tJsonLangDB.Create;
begin
  //
end;

Destructor tJsonLangDB.Destroy;
begin
  inherited;

end;

end.
