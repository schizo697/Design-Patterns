unit NoAmmoState;

interface

uses
  GunState, SysUtils;

type
  TNoAmmoState = class(TGunState)
  public
    procedure Pull(AGun: TGun); override;
    procedure Release(AGun: TGun); override;
    procedure Reload(AGun: TGun); override;
    function GetStateName: string; override;
  end;

implementation

uses
  ReloadingState;

{ TNoAmmoState }

procedure TNoAmmoState.Pull(AGun: TGun);
begin
  WriteLn('No ammo! Reload required.');
end;

procedure TNoAmmoState.Release(AGun: TGun);
begin
  WriteLn('Trigger released.');
end;

procedure TNoAmmoState.Reload(AGun: TGun);
begin
  WriteLn('Reloading...');
  AGun.SetState(TReloadingState.Create);
end;

function TNoAmmoState.GetStateName: string;
begin
  Result := 'No Ammo';
end;

end.
