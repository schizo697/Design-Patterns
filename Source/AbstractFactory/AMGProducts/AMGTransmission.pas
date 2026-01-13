unit AMGTransmission;

interface

uses
  Transmission;

type
  TAMGTransmission = class(TTransmission)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TAMGTransmission }

function TAMGTransmission.GetSpecs: string;
begin
  Result := '9-speed AMG Speedshift MCT';
end;

end.
