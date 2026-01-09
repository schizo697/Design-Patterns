unit NissanInterior;

interface

uses
  Interior;

type
  TNissanInterior = class(TInterior)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TNissanInterior }

function TNissanInterior.GetSpecs: string;
begin
  Result := 'Recaro Sports Seats with Leather';
end;

end.
