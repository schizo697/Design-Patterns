program Observer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  AccountIntf in '..\..\..\..\Documents\Embarcadero\Studio\Projects\Design Patterns\Observer Pattern\AccountIntf.pas',
  ObsCoin in '..\..\..\..\Documents\Embarcadero\Studio\Projects\Design Patterns\Observer Pattern\ObsCoin.pas',
  Account in '..\..\..\..\Documents\Embarcadero\Studio\Projects\Design Patterns\Observer Pattern\Account.pas';

begin
  Randomize;

  try
    var Coin: TObsCoin;
    var Choice: Integer;
    var Name: string;
    var Amount: Double;
    var AccountCount: Integer;

    Coin := TObsCoin.Create;
    AccountCount := 0;

    try
      repeat
        Writeln;
        Writeln('===== OBS COIN MENU =====');
        Writeln('1. Create account');
        Writeln('2. Detach account');
        Writeln('3. Increase price');
        Writeln('4. Decrease price');
        Writeln('5. Exit');
        Write('Choose: ');
        Readln(Choice);

        case Choice of
          1:
            begin
              if AccountCount >= 3 then
              begin
                Writeln('Maximum of 3 accounts reached.');
                Continue;
              end;

              Write('Enter account name: ');
              Readln(Name);

              Write('Enter deposit amount: ');
              Readln(Amount);

              Coin.Attach(TAccount.Create(Name, Amount));
              Inc(AccountCount);

              Writeln('Account created and attached.');
            end;

          2:
            begin
              Write('Enter account name to detach: ');
              Readln(Name);

              Coin.DetachByName(Name);
              if AccountCount > 0 then
                Dec(AccountCount);
            end;

          3:
            begin
              Writeln('--- Price Increased ---');
              Coin.IncreasePrice;
            end;

          4:
            begin
              Writeln('--- Price Decreased ---');
              Coin.DecreasePrice;
            end;
        end;

      until Choice = 5;

    finally
      Coin.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

