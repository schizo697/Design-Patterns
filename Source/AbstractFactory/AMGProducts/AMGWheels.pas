unit AMGWheels;

interface

uses
  Wheels;

type
  TAMGWheels = class(TWheels)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TAMGWheels }

function TAMGWheels.GetSpecs: string;
begin
  Result := '21" AMG Cross-Spoke Forged';
end;

end.
