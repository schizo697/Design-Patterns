unit AMGInterior;

interface

uses
  Interior;

type
  TAMGInterior = class(TInterior)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TAMGInterior }

function TAMGInterior.GetSpecs: string;
begin
  Result := 'Nappa Leather Performance Seats';
end;

end.
