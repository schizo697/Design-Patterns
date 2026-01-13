unit SlashBehavior;

interface

uses
  AttackBehaviorIntf;

type
  TSlashBehavior = class(TInterfacedObject, IAttackBehavior)
  public
    function Attack: string;
  end;

implementation

{ TSlashBehavior }

function TSlashBehavior.Attack: string;
begin
  Result := 'Performing Slash Attacks';
end;

end.
