unit NatureSword;

interface

uses
  SwordIntf;

type
  TNatureSword = class(TInterfacedObject, ISword)
  public
    function GetDamage: Integer;
    function GetDescription: string;
    function GetEffect: string;
  end;

implementation

{ TNatureSword }

function TNatureSword.GetDamage: Integer;
begin
  Result := 5;
end;

function TNatureSword.GetDescription: string;
begin
  Result := 'Nature Sword'
end;

function TNatureSword.GetEffect: string;
begin
  Result := 'Nature Effect - Can heal a target'
end;

end.
