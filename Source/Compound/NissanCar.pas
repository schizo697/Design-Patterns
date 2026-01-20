unit NissanCar;

interface

uses
  Car;

type
  TNissanCar = class(TCar)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TNissanCar }

function TNissanCar.GetDescription: string;
begin
  Result := 'Nissan Gtr'
end;

function TNissanCar.GetPrice: Double;
begin
  Result := 1250000;
end;

end.
