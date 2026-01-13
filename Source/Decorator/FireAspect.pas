unit FireAspect;

interface

uses
  WeaponDecorator, WeaponIntf;

type
  TFireAspect = class(TWeaponDecorator)
  public
    function GetDamage: Integer; override;
    function GetDescription: string; override;
    procedure Display; override;
  end;

implementation

{ TFireAspect }

procedure TFireAspect.Display;
begin
  Writeln('Weapon ', GetDescription);
  Writeln('Damage ', GetDamage);
end;

function TFireAspect.GetDamage: Integer;
begin
  Result := FWeapon.GetDamage + 5;
end;

function TFireAspect.GetDescription: string;
begin
  Result := FWeapon.GetDescription + ' + Burn Damage';
end;

end.
