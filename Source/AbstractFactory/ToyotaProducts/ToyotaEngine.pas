unit ToyotaEngine;

interface

uses
  Engine;

type
  TToyotaEngine = class(TEngine)
  public
    function GetSpecs: string; override;
  end;

implementation

{ TToyotaEngine }

function TToyotaEngine.GetSpecs: string;
begin
  Result := '3.0L Inline-6 Twin-Turbo (382 HP)';
end;

end.
