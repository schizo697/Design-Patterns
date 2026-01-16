program Composite;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CarIntf in 'CarIntf.pas',
  Car in 'Car.pas',
  CarGarage in 'CarGarage.pas',
  NissanGarage in 'NissanGarage.pas',
  ToyotaGarage in 'ToyotaGarage.pas';

var
  Nissan, Toyota: ICar;
  Choice: Integer;

begin
  Nissan := CreateNissanGarage;
  Toyota := CreateToyotaGarage;

  repeat
    Writeln;
    Writeln('=== Car Dealership Menu ===');
    Writeln('1. Display All Cars');
    Writeln('0. Exit');
    Write('Enter choice: ');
    Readln(Choice);

    case Choice of
      1:
        begin
          Writeln;
          Writeln('--- Displaying Cars in Garages ---');
          Nissan.Display;
          Toyota.Display;
        end;
      0:
        Writeln('Exiting program...');
    else
      Writeln('Invalid choice! Please try again.');
    end;

  until Choice = 0;

end.
