program Strategy;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  WeaponBase in 'WeaponBase.pas',
  Sword in 'Sword.pas',
  Spear in 'Spear.pas',
  SlashBehavior in 'SlashBehavior.pas',
  StabBehavior in 'StabBehavior.pas';

procedure ShowWeaponMenu;
begin
  WriteLn;
  WriteLn('===== SELECT WEAPON =====');
  WriteLn('1. Sword');
  WriteLn('2. Spear');
  WriteLn('0. Exit');
  Write('Choice: ');
end;

procedure ShowActionMenu;
begin
  WriteLn;
  WriteLn('===== ACTION MENU =====');
  WriteLn('1. Attack');
  WriteLn('2. Change Attack Behavior');
  WriteLn('3. Change Weapon');
  WriteLn('0. Exit');
  Write('Choice: ');
end;

procedure ShowBehaviorMenu;
begin
  WriteLn;
  WriteLn('===== ATTACK BEHAVIOR =====');
  WriteLn('1. Slash');
  WriteLn('2. Stab');
  Write('Choice: ');
end;

var
  Weapon: TWeapon;
  Choice: Integer;
  Input: string;
  Running: Boolean;

begin
  Weapon := nil;
  Running := True;

  WriteLn('=== WEAPON SYSTEM ===');

  while Running do
  begin
    if Weapon = nil then
    begin
      ShowWeaponMenu;
      ReadLn(Input);

      if not TryStrToInt(Input, Choice) then
        Choice := -1;

      case Choice of
        1:
          Weapon := TSword.Create(TSlashBehavior.Create);
        2:
          Weapon := TSpear.Create(TStabBehavior.Create);
        0:
          Running := False;
      else
        WriteLn('Invalid choice!');
      end;

      if Weapon <> nil then
        WriteLn('Weapon selected: ', Weapon.GetName);
    end
    else
    begin
      ShowActionMenu;
      ReadLn(Input);

      if not TryStrToInt(Input, Choice) then
        Choice := -1;

      case Choice of
        1:
          Weapon.PerformAttack;

        2:
        begin
          ShowBehaviorMenu;
          ReadLn(Input);

          if not TryStrToInt(Input, Choice) then
            Choice := -1;

          case Choice of
            1:
            begin
              Weapon.SetAttackBehavior(TSlashBehavior.Create);
              WriteLn('Attack behavior changed to SLASH.');
            end;
            2:
            begin
              Weapon.SetAttackBehavior(TStabBehavior.Create);
              WriteLn('Attack behavior changed to STAB.');
            end;
          else
            WriteLn('Invalid behavior choice!');
          end;
        end;

        3:
        begin
          Weapon.Free;
          Weapon := nil;
        end;

        0:
          Running := False;
      else
        WriteLn('Invalid option!');
      end;
    end;
  end;

  if Assigned(Weapon) then
    Weapon.Free;

  WriteLn;
  WriteLn('Exiting... May your strikes be true!');
  ReadLn;
end.

