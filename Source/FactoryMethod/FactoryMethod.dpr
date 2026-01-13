program FactoryMethod;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Car in 'Car.pas',
  NissanCar in 'NissanCar.pas',
  ToyotaCar in 'ToyotaCar.pas',
  AMGCar in 'AMGCar.pas',
  CarCreator in 'CarCreator.pas',
  NissanCreator in 'NissanCreator.pas',
  ToyotaCreator in 'ToyotaCreator.pas',
  AMGCreator in 'AMGCreator.pas';

var
  Choice: Integer;
  CarCreator: TCarCreator;
  Continue: Boolean;

begin
  try
    Continue := True;

    while Continue do
    begin
      Writeln('=== Car Factory Method Pattern ===');
      Writeln;
      Writeln('Which car would you like to buy?');
      Writeln('1. Nissan GT-R');
      Writeln('2. Toyota Supra');
      Writeln('3. Mercedes-AMG GT 63 S');
      Writeln('4. Exit');
      Writeln;
      Write('Enter your choice (1-4): ');
      Readln(Choice);
      Writeln;

      CarCreator := nil;

      case Choice of
        1:
          begin
            CarCreator := TNissanCreator.Create;
          end;
        2:
          begin
            CarCreator := TToyotaCreator.Create;
          end;
        3:
          begin
            CarCreator := TAMGCreator.Create;
          end;
        4:
          begin
            Writeln('Thank you for visiting! Goodbye.');
            Continue := False;
          end;
      else
        Writeln('Invalid choice! Please select 1-4.');
        Writeln;
      end;

      if Assigned(CarCreator) then
      begin
        try
          CarCreator.SellCar;
          Writeln('Congratulations on your purchase!');
          Writeln;
        finally
          CarCreator.Free;
        end;
      end;

      if Continue then
      begin
        Writeln('Press Enter to continue...');
        Readln;
        Writeln;
      end;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
