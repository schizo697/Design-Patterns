program Iterator;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Car in 'Car.pas',
  CarIntf in 'CarIntf.pas',
  NissanGarage in 'NissanGarage.pas',
  ToyotaGarage in 'ToyotaGarage.pas';

procedure DisplayCars(const Title: string; Iterator: ICar);
begin
  Writeln('=== ', Title, ' ===');

  while Iterator.HasNext do
    Writeln(Iterator.Next.GetName);

  Writeln;
end;

var
  Nissan: TNissanGarage;
  Toyota: TToyotaGarage;
  Choice: Integer;

begin
  Nissan := TNissanGarage.Create;
  Toyota := TToyotaGarage.Create;

  try
    repeat
      Writeln('=== Garage Menu ===');
      Writeln('1 - Display Cars');
      Writeln('0 - Exit');
      Write('Choice: ');
      Readln(Choice);
      Writeln;

      case Choice of
        1:
          begin
            DisplayCars('Nissan Garage', Nissan.CreateIterator);
            DisplayCars('Toyota Garage', Toyota.CreateIterator);
          end;
        0:
          Writeln('Exiting...');
      else
        Writeln('Invalid choice.');
      end;

      Writeln;
    until Choice = 0;

  finally
    Nissan.Free;
    Toyota.Free;
  end;
end.
