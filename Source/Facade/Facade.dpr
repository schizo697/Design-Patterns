program Facade;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CarFacade in 'CarFacade.pas';

var
  Car: TCarFacade;
  Choice: Integer;

procedure ShowMenu;
begin
  Writeln('=== Car Control Menu ===');
  Writeln('1. Turn On');
  Writeln('2. Turn Off');
  Writeln('3. Run (start engine)');
  Writeln('4. Stop (engine)');
  Writeln('5. Exit');
  Write('Enter choice: ');
end;

begin
  Car := TCarFacade.Create;
  try
    repeat
      ShowMenu;
      Readln(Choice);
      case Choice of
        1: Car.TurnOn;
        2: Car.TurnOff;
        3: Car.Run;
        4: Car.Stop;
        5: Writeln('Exiting program...');
      else
        Writeln('Invalid choice, try again.');
      end;
      Writeln;
    until Choice = 5;
  finally
    Car.Free;
  end;
end.
