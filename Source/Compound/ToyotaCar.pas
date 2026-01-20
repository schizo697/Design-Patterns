unit ToyotaCar;

interface

uses
  Car;

type
  TToyotaCar = class(TCar)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TToyotaCar }

function TToyotaCar.GetDescription: string;
begin
  Result := 'Toyota Supra'
end;

function TToyotaCar.GetPrice: Double;
begin
  Result := 1100000;
end;

end.
