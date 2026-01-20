program Compound;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Car in 'Car.pas',
  NissanCar in 'NissanCar.pas',
  HondaCar in 'HondaCar.pas',
  ToyotaCar in 'ToyotaCar.pas',
  CarFactory in 'CarFactory.pas',
  CarDecorator in 'CarDecorator.pas',
  TurboDecorator in 'TurboDecorator.pas',
  SpoilerDecorator in 'SpoilerDecorator.pas',
  EngineDecorator in 'EngineDecorator.pas',
  MagsDecorator in 'MagsDecorator.pas',
  RacingWheelsDecorator in 'RacingWheelsDecorator.pas';

var
  MyCar: TCar;
  Choice: Integer;

procedure DisplayCarStatus(ACar: TCar);
begin
  Writeln('-----------------------------');
  Writeln('Current Car Configuration:');
  Writeln(ACar.GetDescription);
  Writeln('Total Price: ', FormatFloat('#,##0', ACar.GetPrice));
  Writeln('-----------------------------');
end;

begin

  Writeln('Select Car Brand');
  Writeln('1. Nissan');
  Writeln('2. Honda');
  Writeln('3. Toyota');
  Write('Choice: ');
  Readln(Choice);

  MyCar := TCarFactory.CreateCar(Choice);

  if MyCar = nil then
  begin
    Writeln('Invalid choice.');
    Readln;
    Exit;
  end;

  DisplayCarStatus(MyCar);

  repeat
    Writeln;
    Writeln('Add Parts');
    Writeln('1. Turbo');
    Writeln('2. Spoiler');
    Writeln('3. Upgraded Engine');
    Writeln('4. Racing Wheels');
    Writeln('5. Mags');
    Writeln('0. Exit');
    Write('Choice: ');
    Readln(Choice);

    case Choice of
      1:
        begin
          MyCar := TTurboDecorator.Create(MyCar);
          Writeln('Turbo added.');
          DisplayCarStatus(MyCar);
        end;
      2:
        begin
          MyCar := TSpoilerDecorator.Create(MyCar);
          Writeln('Spoiler added.');
          DisplayCarStatus(MyCar);
        end;
      3:
        begin
          MyCar := TEngineDecorator.Create(MyCar);
          Writeln('Upgraded Engine added.');
          DisplayCarStatus(MyCar);
        end;
      4:
        begin
          MyCar := TRacingWheelsDecorator.Create(MyCar);
          Writeln('Racing Wheels added.');
          DisplayCarStatus(MyCar);
        end;
      5:
        begin
          MyCar := TMagsDecorator.Create(MyCar);
          Writeln('Mags added.');
          DisplayCarStatus(MyCar);
        end;
    end;

  until Choice = 0;

  Writeln;
  Writeln('Final Car Summary:');
  DisplayCarStatus(MyCar);

  Readln;
end.
