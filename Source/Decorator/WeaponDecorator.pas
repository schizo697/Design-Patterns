unit WeaponDecorator;

interface

uses
  WeaponIntf;

type
  TWeaponDecorator = class(TInterfacedObject, IWeapon)
  protected
    FWeapon: IWeapon;
  public
    constructor Create(AWeapon: IWeapon);
    function GetDamage: Integer; virtual; abstract;
    function GetDescription: string; virtual; abstract;
    procedure Display; virtual;
  end;

implementation

{ TWeaponDecorator }

constructor TWeaponDecorator.Create(AWeapon: IWeapon);
begin
  FWeapon := AWeapon;
end;

procedure TWeaponDecorator.Display;
begin
  Writeln('Weapon ', GetDescription);
  Writeln('Damage ', GetDamage);
end;

end.
