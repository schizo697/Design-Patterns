unit Engine;

interface

type
  TEngine = class
  public
    function GetSpecs: string; virtual; abstract;
    procedure DisplayInfo;
  end;

implementation

{ TEngine }

procedure TEngine.DisplayInfo;
begin
  Writeln('Engine ', GetSpecs);
end;

end.
