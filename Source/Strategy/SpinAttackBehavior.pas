unit SpinAttackBehavior;

interface

uses
  AttackBehaviorIntf;

type
  TSpinAttackBehavior = class(TInterfacedObject, IAttackBehavior)
  public
    function Attack: string;
  end;

implementation

{ TSpinAttackBehavior }

function TSpinAttackBehavior.Attack: string;
begin
  Result := 'Performing Spin Attack - Exclusive Sword Skill';
end;

end.
