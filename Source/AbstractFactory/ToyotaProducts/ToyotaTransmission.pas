unit ToyotaTransmission;

interface

uses
  Transmission;

type
  TToyotaTransmission = class(TTransmission)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TToyotaTransmission }

function TToyotaTransmission.GetSpecs: string;
begin
  Result := '8-speed Automatic';
end;

end.
