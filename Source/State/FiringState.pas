unit FiringState;

interface

uses
  GunState, SysUtils;

type
  TFiringState = class(TGunState)
  public
    procedure Pull(AGun: TGun); override;
    procedure Release(AGun: TGun); override;
    procedure Reload(AGun: TGun); override;
    function GetStateName: string; override;
  end;

implementation

uses
  ReadyState, NoAmmoState;

{ TFiringState }

procedure TFiringState.Pull(AGun: TGun);
begin
  WriteLn('Firing..');
end;

procedure TFiringState.Release(AGun: TGun);
begin
  WriteLn('Shot fired!');
  AGun.DecrementAmmo;

  if AGun.GetAmmoCount > 0 then
  begin
    WriteLn(Format('Ammo remaining: %d', [AGun.GetAmmoCount]));
    AGun.SetState(TReadyState.Create);
  end
  else
  begin
    WriteLn('Out of ammo!');
    AGun.SetState(TNoAmmoState.Create);
  end;
end;

procedure TFiringState.Reload(AGun: TGun);
begin
  WriteLn('Cannot reload while trigger is pulled!');
end;

function TFiringState.GetStateName: string;
begin
  Result := 'Firing';
end;

end.
