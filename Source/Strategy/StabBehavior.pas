unit StabBehavior;

interface

uses
  AttackBehaviorIntf;

type
  TStabBehavior = class(TInterfacedObject, IAttackBehavior)
  public
    function Attack: string;
  end;

implementation

{ TStabBehavior }

function TStabBehavior.Attack: string;
begin
  Result := 'Performing Stab Attacks';
end;

end.
