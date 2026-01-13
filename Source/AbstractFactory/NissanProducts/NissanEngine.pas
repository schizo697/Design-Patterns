unit NissanEngine;

interface

uses
  Engine;

type
  TNissanEngine = class(TEngine)
  public
   function GetSpecs: string; override;
  end;

implementation

{ TNissanEngine }

function TNissanEngine.GetSpecs: string;
begin
  Result := '3.8L V6 Twin-Turbo (565 HP)';
end;

end.
