unit AMGEngine;

interface

uses
  Engine;

type
  TAMGEngine = class(TEngine)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TAMGEngine }

function TAMGEngine.GetSpecs: string;
begin
  Result := '4.0L V8 Bi-Turbo (630 HP)';
end;

end.
