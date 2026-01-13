program AbstractFactory;
{$APPTYPE CONSOLE}
{$R *.res}
uses
  System.SysUtils,
  Engine in 'Engine.pas',
  Transmission in 'Transmission.pas',
  Wheels in 'Wheels.pas',
  Interior in 'Interior.pas',
  NissanEngine in 'NissanProducts\NissanEngine.pas',
  NissanTransmission in 'NissanProducts\NissanTransmission.pas',
  NissanWheels in 'NissanProducts\NissanWheels.pas',
  NissanInterior in 'NissanProducts\NissanInterior.pas',
  ToyotaEngine in 'ToyotaProducts\ToyotaEngine.pas',
  ToyotaInterior in 'ToyotaProducts\ToyotaInterior.pas',
  ToyotaTransmission in 'ToyotaProducts\ToyotaTransmission.pas',
  ToyotaWheels in 'ToyotaProducts\ToyotaWheels.pas',
  AMGEngine in 'AMGProducts\AMGEngine.pas',
  AMGTransmission in 'AMGProducts\AMGTransmission.pas',
  AMGWheels in 'AMGProducts\AMGWheels.pas',
  AMGInterior in 'AMGProducts\AMGInterior.pas',
  CarFactory in 'CarFactory.pas',
  NissanCarFactory in 'CarFactories\NissanCarFactory.pas',
  ToyotaCarFactory in 'CarFactories\ToyotaCarFactory.pas',
  AMGCarFactory in 'CarFactories\AMGCarFactory.pas',
  Car in 'Car.pas';

procedure BuildCar(Factory: ICarFactory; BrandName: string);
var
  MyCar: TCar;
  MyEngine: TEngine;
  MyTransmission: TTransmission;
  MyWheels: TWheels;
  MyInterior: TInterior;
begin
  MyEngine := Factory.CreateEngine;
  MyTransmission := Factory.CreateTransmission;
  MyWheels := Factory.CreateWheels;
  MyInterior := Factory.CreateInterior;

  MyCar := TCar.Create(MyEngine, MyTransmission, MyWheels, MyInterior, BrandName);
  try
    MyCar.ShowSpecs;
    Writeln('Congratulations on your purchase!');
    Writeln;
  finally
    MyCar.Free;
  end;
end;

var
  Choice: Integer;
  Factory: ICarFactory;
  Continue: Boolean;

begin
  try
    Continue := True;

    while Continue do
    begin
      Writeln('=== Car Abstract Factory Pattern ===');
      Writeln;
      Writeln('Which car brand would you like to build?');
      Writeln('1. Nissan GT-R');
      Writeln('2. Toyota Supra');
      Writeln('3. Mercedes-AMG GT 63 S');
      Writeln('4. Exit');
      Writeln;
      Write('Enter your choice (1-4): ');
      Readln(Choice);
      Writeln;

      case Choice of
        1:
          begin
            Factory := TNissanCarFactory.Create;
            BuildCar(Factory, 'Nissan GT-R');
          end;
        2:
          begin
            Factory := TToyotaCarFactory.Create;
            BuildCar(Factory, 'Toyota Supra');
          end;
        3:
          begin
            Factory := TAMGCarFactory.Create;
            BuildCar(Factory, 'Mercedes-AMG GT 63 S');
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
