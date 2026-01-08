unit DivineSword;

interface

uses
  SwordIntf;

type
  TDivineSword = class(TInterfacedObject, ISword)
  public
    function GetDamage: Integer;
    function GetDescription: string;
    function GetEffect: string;
  end;

implementation

{ TDivineSword }

function TDivineSword.GetDamage: Integer;
begin
  Result := 5;
end;

function TDivineSword.GetDescription: string;
begin
  Result := 'Divine Sword'
end;

function TDivineSword.GetEffect: string;
begin
  Result := 'Divinity Effect - purifies the target';
end;

end.
