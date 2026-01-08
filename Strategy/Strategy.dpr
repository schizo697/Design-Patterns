program Strategy;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  SwordIntf in 'SwordIntf.pas',
  SwordBase in 'SwordBase.pas',
  CursedSword in 'CursedSword.pas',
  DivineSword in 'DivineSword.pas',
  NatureSword in 'NatureSword.pas';

procedure DisplayMenu;
begin
  WriteLn;
  WriteLn('========== SWORD MENU ==========');
  WriteLn('1. View Current Sword');
  WriteLn('2. Switch to Cursed Sword');
  WriteLn('3. Switch to Divine Sword');
  WriteLn('4. Switch to Nature Sword');
  WriteLn('5. Compare All Swords');
  WriteLn('0. Exit');
  WriteLn('================================');
  Write('Choose an option: ');
end;

procedure CompareAllSwords;
var
  CursedSwordObj, DivineSwordObj, NatureSwordObj: TSword;
begin
  WriteLn;
  WriteLn('===== COMPARING ALL SWORDS =====');
  WriteLn;

  CursedSwordObj := TSword.Create(TCursedSword.Create);
  DivineSwordObj := TSword.Create(TDivineSword.Create);
  NatureSwordObj := TSword.Create(TNatureSword.Create);

  try
    CursedSwordObj.DisplayInfo;
    DivineSwordObj.DisplayInfo;
    NatureSwordObj.DisplayInfo;
  finally
    CursedSwordObj.Free;
    DivineSwordObj.Free;
    NatureSwordObj.Free;
  end;
end;

var
  CurrentSword: TSword;
  Choice: Integer;
  InputStr: string;
  Running: Boolean;

begin
  CurrentSword := nil;
  try
    WriteLn('===== SWORD STRATEGY PATTERN - INTERACTIVE =====');
    WriteLn;
    WriteLn('Welcome, Warrior! Choose your sword wisely.');


    CurrentSword := TSword.Create(TCursedSword.Create);
    WriteLn;
    WriteLn('You currently wield the Cursed Sword!');

    Running := True;

    while Running do
    begin
      DisplayMenu;
      ReadLn(InputStr);


      if not TryStrToInt(InputStr, Choice) then
        Choice := -1;

      case Choice of
        1:
        begin
          WriteLn;
          WriteLn('===== YOUR CURRENT SWORD =====');
          WriteLn;
          CurrentSword.DisplayInfo;
        end;

        2:
        begin
          CurrentSword.Free;
          CurrentSword := TSword.Create(TCursedSword.Create);
          WriteLn;
          WriteLn('You have switched to the Cursed Sword!');
          CurrentSword.DisplayInfo;
        end;

        3:
        begin
          CurrentSword.Free;
          CurrentSword := TSword.Create(TDivineSword.Create);
          WriteLn;
          WriteLn('You have switched to the Divine Sword!');
          CurrentSword.DisplayInfo;
        end;

        4:
        begin
          CurrentSword.Free;
          CurrentSword := TSword.Create(TNatureSword.Create);
          WriteLn;
          WriteLn('You have switched to the Nature Sword!');
          CurrentSword.DisplayInfo;
        end;

        5:
        begin
          CompareAllSwords;
        end;

        0:
        begin
          WriteLn;
          WriteLn('Thank you for using the Sword Strategy Pattern!');
          WriteLn('May your blade strike true!');
          Running := False;
        end;

      else
        WriteLn;
        WriteLn('Invalid option! Please choose 0-5.');
      end;
    end;

    if Assigned(CurrentSword) then
      CurrentSword.Free;

  except
    on E: Exception do
    begin
      WriteLn('Error: ', E.Message);
      if Assigned(CurrentSword) then
        CurrentSword.Free;
    end;
  end;
end.
