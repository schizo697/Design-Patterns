unit NissanTransmission;

interface

uses
  Transmission;

type
  TNissanTransmission = class(TTransmission)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TNissanTransmission }

function TNissanTransmission.GetSpecs: string;
begin
  Result := '6-speed Dual-Clutch';
end;

end.
