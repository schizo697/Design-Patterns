unit ReloadingState;

interface

uses
  GunState, SysUtils;

type
  TReloadingState = class(TGunState)
  public
    procedure Pull(AGun: TGun); override;
    procedure Release(AGun: TGun); override;
    procedure Reload(AGun: TGun); override;
    function GetStateName: string; override;
  end;

implementation

uses
  ReadyState;

{ TReloadingState }

procedure TReloadingState.Pull(AGun: TGun);
begin
  WriteLn('Cannot fire while reloading!');
end;

procedure TReloadingState.Release(AGun: TGun);
begin
  WriteLn('Reload complete!');
  AGun.RefillAmmo;
  WriteLn(Format('Magazine full: %d rounds', [AGun.GetAmmoCount]));
  AGun.SetState(TReadyState.Create);
end;

procedure TReloadingState.Reload(AGun: TGun);
begin
  WriteLn('Already reloading...');
end;

function TReloadingState.GetStateName: string;
begin
  Result := 'Reloading';
end;

end.
