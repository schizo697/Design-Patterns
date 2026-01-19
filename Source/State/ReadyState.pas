unit ReadyState;

interface

uses
  GunState, SysUtils;

type
  TReadyState = class(TGunState)
  public
    procedure Pull(AGun: TGun); override;
    procedure Release(AGun: TGun); override;
    procedure Reload(AGun: TGun); override;
    function GetStateName: string; override;
  end;

implementation

uses
  FiringState;

{ TReadyState }

procedure TReadyState.Pull(AGun: TGun);
begin
  WriteLn('Trigger pulled');
  AGun.SetState(TFiringState.Create);
end;

procedure TReadyState.Release(AGun: TGun);
begin
  WriteLn('Trigger is already released.');
end;

procedure TReadyState.Reload(AGun: TGun);
begin
  WriteLn('Gun already loaded.');
end;

function TReadyState.GetStateName: string;
begin
  Result := 'Ready';
end;

end.
