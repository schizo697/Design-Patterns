unit Interior;

interface

type
  TInterior = class
  public
    function GetSpecs: string; virtual; abstract;
    procedure DisplayInfo;
  end;

implementation

{ TInterior }

procedure TInterior.DisplayInfo;
begin
  Writeln('Interior ', GetSpecs);
end;

end.

