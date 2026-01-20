unit CarFactory;

interface

uses
  Car;

type
  TCarFactory = class
  public
    class function CreateCar(CarType: Integer): TCar;
  end;

implementation

uses
  NissanCar, HondaCar, ToyotaCar;

{ TCarFactory }

class function TCarFactory.CreateCar(CarType: Integer): TCar;
begin
  case CarType of
    1: Result := TNissanCar.Create;
    2: Result := THondaCar.Create;
    3: Result := TToyotaCar.Create;
  else
    Result := nil;
  end;
end;


end.
