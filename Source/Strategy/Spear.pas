unit Spear;

interface

uses
  WeaponBase;

type
  TSpear = class(TWeapon)
  public
    function GetName: string; override;
  end;

implementation

{ TSpear }

function TSpear.GetName: string;
begin
  Result := 'Long Spear';
end;

end.
