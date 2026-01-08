unit Account;

interface

uses
  AccountIntf;

type
  TAccount = class(TInterfacedObject, IAccount)
  private
    FName: string;
    FDeposit: double;
  public
    constructor Create(AName: string; ADeposit: Double);
    procedure Update(ACoinPrice: Double);
    function GetName: string;
  end;

implementation

uses
  SysUtils;

{ TAccount }

constructor TAccount.Create(AName: string; ADeposit: Double);
begin
  FName := AName;
  FDeposit := ADeposit;
end;

function TAccount.GetName: string;
begin
  Result := FName;
end;

procedure TAccount.Update(ACoinPrice: Double);
var
  Value: Double;
begin
  Value := FDeposit * ACoinPrice;

  Writeln(
    Format(
      '%s | Deposit: %.2f | Coin Price: %.2f | Value: %.2f',
      [FName, FDeposit, ACoinPrice, Value]
    )
  );
end;

end.
