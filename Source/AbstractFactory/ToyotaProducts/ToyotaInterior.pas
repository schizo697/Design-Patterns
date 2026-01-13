unit ToyotaInterior;

interface

uses
  Interior;

type
  TToyotaInterior = class(TInterior)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TToyotaInterior }

function TToyotaInterior.GetSpecs: string;
begin
  Result := 'Alcantara Premium Interior';
end;

end.
