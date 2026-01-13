unit Wheels;

interface

type
  TWheels = class
  public
    function GetSpecs: string; virtual; abstract;
    procedure DisplayInfo;
  end;

implementation

{ TWheel }

procedure TWheels.DisplayInfo;
begin
  Writeln('Wheels ', GetSpecs);
end;

end.
