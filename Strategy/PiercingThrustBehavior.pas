unit PiercingThrustBehavior;

interface

uses
  AttackBehaviorIntf;

type
  TPiercingThrustBehavior = class(TInterfacedObject, IAttackBehavior)
  public
    function Attack: string;
  end;

implementation

{ TPiercingThrustBehavior }

function TPiercingThrustBehavior.Attack: string;
begin
  Result := 'Performing Piercing Thrust - Exclusive Spear Skill'
end;

end.
