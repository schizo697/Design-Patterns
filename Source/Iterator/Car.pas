unit Car;

interface

type
  TCar = class
  private
    FName: string;
  public
    constructor Create(const AName: string);
    function GetName: string;
  end;

implementation

{ TCar }

constructor TCar.Create(const AName: string);
begin
  FName := AName;
end;

function TCar.GetName: string;
begin
  Result := FName;
end;

end.
