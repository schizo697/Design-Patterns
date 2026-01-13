unit NissanWheels;

interface

uses
  Wheels;

type
  TNissanWheels = class(TWheels)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TNissanWheels }

function TNissanWheels.GetSpecs: string;
begin
  Result := '20" RAYS Forged Aluminum';
end;

end.
