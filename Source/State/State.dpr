program State;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  TrafficLightIntf in 'TrafficLightIntf.pas',
  Car in 'Car.pas',
  StopState in 'StopState.pas',
  SlowDownState in 'SlowDownState.pas',
  GoState in 'GoState.pas',
  TrafficLight in 'TrafficLight.pas';

procedure ShowMenu;
begin
  WriteLn;
  WriteLn('=== Traffic Light Control ===');
  WriteLn('1. Change to RED');
  WriteLn('2. Change to GREEN');
  WriteLn('3. Change to ORANGE');
  WriteLn('4. Show Current Status');
  WriteLn('0. Exit');
  Write('Enter your choice: ');
end;

procedure ShowCurrentStatus(Light: TTrafficLight; MyCar: TCar);
begin
  WriteLn;
  WriteLn('--- Current Status ---');
  WriteLn('Traffic Light: ', Light.GetCurrentColor);
  WriteLn('Car Status: ', MyCar.GetStatus);
  WriteLn('---------------------');
end;

var
  Light: TTrafficLight;
  MyCar: TCar;
  Choice: string;
  ChoiceNum: Integer;

begin
  try
    Light := TTrafficLight.Create;
    MyCar := TCar.Create;
    try
      WriteLn('=== Traffic Light ===');

      ShowCurrentStatus(Light, MyCar);

      repeat
        ShowMenu;
        ReadLn(Choice);

        if not TryStrToInt(Choice, ChoiceNum) then
        begin
          WriteLn('Invalid input! Please enter a number.');
          Continue;
        end;

        case ChoiceNum of
          1: begin
               Light.ChangeToRed;
               Light.ApplyToCar(MyCar);
               WriteLn;
               WriteLn('>> Traffic light changed to RED');
               ShowCurrentStatus(Light, MyCar);
             end;

          2: begin
               Light.ChangeToGreen;
               Light.ApplyToCar(MyCar);
               WriteLn;
               WriteLn('>> Traffic light changed to GREEN');
               ShowCurrentStatus(Light, MyCar);
             end;

          3: begin
               Light.ChangeToOrange;
               Light.ApplyToCar(MyCar);
               WriteLn;
               WriteLn('>> Traffic light changed to ORANGE');
               ShowCurrentStatus(Light, MyCar);
             end;

          4: begin
               ShowCurrentStatus(Light, MyCar);
             end;

          0: begin
               WriteLn;
               WriteLn('Exiting program. Goodbye!');
             end;

        else
          WriteLn('Invalid choice! Please select 0-4.');
        end;

      until ChoiceNum = 0;

    finally
      MyCar.Free;
      Light.Free;
    end;

  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
