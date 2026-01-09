unit CarCreator;

interface

uses
  Car, SysUtils;

type
  TCarCreator = class
  public
    function CreateCar: TCar; virtual; abstract;
    procedure SellCar;
  end;

implementation

{ TCarCreator }

procedure TCarCreator.SellCar;
var
  Car: TCar;
begin
  Car := CreateCar;
  try
    Writeln('Selling a car:');
    Car.DisplayInfo;
  finally
    Car.Free;
  end;
end;

end.
