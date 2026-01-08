unit WeaponIntf;

interface

['{7D7C6723-4992-4EE8-B459-374F9BE4C78E}']
type
  IWeapon = interface
  function GetDamage: Integer;
  function GetDescription: string;
  procedure Display;
  end;

implementation

end.
