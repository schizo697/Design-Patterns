unit ToyotaWheels;

interface

uses
  Wheels;

type
  TToyotaWheels = class(TWheels)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TToyotaWheels }

function TToyotaWheels.GetSpecs: string;
begin
  Result := '19" BBS Forged Wheels';
end;

end.
