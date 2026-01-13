unit Sword;

interface

uses
  WeaponBase;

type
  TSword = class(TWeapon)
  public
    function GetName: string; override;
  end;

implementation

{ TSword }

function TSword.GetName: string;
begin
  Result := 'Iron Sword';
end;

end.
