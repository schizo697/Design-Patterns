unit GunState;

interface

type
  TGun = class;

  TGunState = class abstract
  public
    procedure Pull(AGun: TGun); virtual; abstract;
    procedure Release(AGun: TGun); virtual; abstract;
    procedure Reload(AGun: TGun); virtual; abstract;
    function GetStateName: string; virtual; abstract;
  end;

  TGun = class
  private
    FState: TGunState;
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

uses
  ReadyState;

{ TGun }

constructor TGun.Create(AMaxAmmo: Integer = 6);
begin
  inherited Create;
  FMaxAmmo := AMaxAmmo;
  FAmmoCount := AMaxAmmo;
  FState := TReadyState.Create;
end;

destructor TGun.Destroy;
begin
  if Assigned(FState) then
    FState.Free;
  inherited;
end;

procedure TGun.SetState(AState: TGunState);
begin
  if Assigned(FState) then
    FState.Free;
  FState := AState;
end;

procedure TGun.Pull;
begin
  if Assigned(FState) then
    FState.Pull(Self);
end;

procedure TGun.Release;
begin
  if Assigned(FState) then
    FState.Release(Self);
end;

procedure TGun.Reload;
begin
  if Assigned(FState) then
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
  if Assigned(FState) then
    Result := FState.GetStateName
  else
    Result := 'Uninitialized';
end;

end.
