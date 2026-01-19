program State;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  GunState in 'GunState.pas',
  NoAmmoState in 'NoAmmoState.pas',
  ReadyState in 'ReadyState.pas',
  FiringState in 'FiringState.pas',
  ReloadingState in 'ReloadingState.pas';

var
  MyGun: TGun;
  UserInput: string;
  ShotsFired: Integer;

begin
  try
    MyGun := TGun.Create(3);
    try
      ShotsFired := 0;
      WriteLn('=== Gun Firing Simulator ===');
      WriteLn('Commands: F = Fire, Q = Quit');
      WriteLn('Magazine capacity: 3 rounds');
      WriteLn('Auto-reload enabled');
      WriteLn('=============================');
      WriteLn;

      while True do
      begin
        WriteLn(Format('Status: %s | Ammo: %d/3 | Total Shots: %d',
          [MyGun.GetStateName, MyGun.GetAmmoCount, ShotsFired]));
        Write('> ');
        ReadLn(UserInput);
        UserInput := UpperCase(Trim(UserInput));

        if UserInput = 'Q' then
        begin
          WriteLn('Exiting simulator...');
          Break;
        end
        else if UserInput = 'F' then
        begin
          WriteLn;

          if MyGun.GetAmmoCount = 0 then
          begin
            WriteLn('--- AUTO-RELOAD ---');
            MyGun.Reload;
            MyGun.Release;
            WriteLn('-------------------');
            WriteLn;
          end;

          MyGun.Pull;
          MyGun.Release;

          if MyGun.GetStateName <> 'No Ammo' then
            Inc(ShotsFired);

          WriteLn;
        end
        else
        begin
          WriteLn('Invalid command! Use F to fire or Q to quit.');
          WriteLn;
        end;
      end;

      WriteLn;
      WriteLn(Format('Session ended. Total shots fired: %d', [ShotsFired]));

    finally
      MyGun.Free;
    end;
  except
    on E: Exception do
      WriteLn(E.ClassName, ': ', E.Message);
  end;
end.
