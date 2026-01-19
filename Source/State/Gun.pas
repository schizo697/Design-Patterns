unit Gun;

interface

uses
  GunState, ReadyState, SysUtils;

type
  TGun = class
  private
    FState: TGunState;
    FOldState: TGunState;
    FAmmoCount: Integer;
    FMaxAmmo: Integer;
  public
    constructor Create(AMaxAmmo: Integer = 6);
    destructor Destroy; override;

    procedure SetState(AState: TGunState);
    procedure Pull;
    procedure Release;
    procedure Reload;

    procedure DecrementAmmo;
    procedure RefillAmmo;
    function GetAmmoCount: Integer;
    function GetStateName: string;
  end;

implementation

{ TGun }

constructor TGun.Create(AMaxAmmo: Integer = 6);
begin
  inherited Create;
  FMaxAmmo := AMaxAmmo;
  FAmmoCount := AMaxAmmo;
  FState := TReadyState.Create;
  FOldState := nil;
end;

destructor TGun.Destroy;
begin
  FState.Free;
  if Assigned(FOldState) then
    FOldState.Free;
  inherited;
end;

procedure TGun.SetState(AState: TGunState);
begin
  if Assigned(FOldState) then
    FOldState.Free;
  FOldState := FState;
  FState := AState;
end;

procedure TGun.Pull;
begin
  FState.Pull(Self);
end;

procedure TGun.Release;
begin
  FState.Release(Self);
end;

procedure TGun.Reload;
begin
  FState.Reload(Self);
end;

procedure TGun.DecrementAmmo;
begin
  if FAmmoCount > 0 then
    Dec(FAmmoCount);
end;

procedure TGun.RefillAmmo;
begin
  FAmmoCount := FMaxAmmo;
end;

function TGun.GetAmmoCount: Integer;
begin
  Result := FAmmoCount;
end;

function TGun.GetStateName: string;
begin
  Result := FState.GetStateName;
end;

end.
