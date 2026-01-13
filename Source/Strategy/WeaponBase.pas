unit WeaponBase;

interface

uses
  AttackBehaviorIntf;

type
  TWeapon = class
  private
    FAttackBehavior: IAttackBehavior;
  public
    constructor Create(ABehavior: IAttackBehavior);
    procedure SetAttackBehavior(ABehavior: IAttackBehavior);
    procedure PerformAttack;
    function GetName: string; virtual; abstract;
  end;

implementation

{ TWeapon }

constructor TWeapon.Create(ABehavior: IAttackBehavior);
begin
  FAttackBehavior := ABehavior;
end;

procedure TWeapon.SetAttackBehavior(ABehavior: IAttackBehavior);
begin
  FAttackBehavior := ABehavior;
end;

procedure TWeapon.PerformAttack;
begin
  Writeln(GetName, ': ', FAttackBehavior.Attack);
end;

end.
