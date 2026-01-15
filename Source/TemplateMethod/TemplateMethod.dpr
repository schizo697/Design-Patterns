program TemplateMethod;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CarRace in 'CarRace.pas',
  Nissan in 'Nissan.pas',
  Toyota in 'Toyota.pas',
  Honda in 'Honda.pas';

var
  Choice: string;

procedure StartRace;
var
  Cars: array[0..2] of TCarRace;
  i: Integer;
begin
  Cars[0] := TNissan.Create;
  Cars[1] := TToyota.Create;
  Cars[2] := THonda.Create;

  try
    Writeln('Get ready for the drag race!');
    Writeln('3...');
    Sleep(1000);
    Writeln('2...');
    Sleep(1000);
    Writeln('1...');
    Sleep(1000);
    Writeln('Go!');
    Writeln;

    for i := 0 to High(Cars) do
    begin
      Writeln('--- Car ', i + 1, ' ---');
      Cars[i].Run;
      Writeln;
      sleep(500);
    end;

    Writeln('Race finished! Press Enter to quit.');
    Readln;

  finally
    for i := 0 to High(Cars) do
      Cars[i].Free;
  end;
end;

begin
  repeat
    Writeln('=== Drag Race Menu ===');
    Writeln('1. Start the Race');
    Writeln('0. Quit');
    Write('Enter choice: ');
    Readln(Choice);

    if Choice = '1' then
    begin
      StartRace;
    end
    else if Choice <> '0' then
      Writeln('Invalid choice. Try again.');

  until Choice = '0';

  Writeln('Goodbye!');
end.
