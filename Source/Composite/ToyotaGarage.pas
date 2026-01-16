unit ToyotaGarage;

interface

uses
  CarGarage, Car, CarIntf, SysUtils;

function CreateToyotaGarage: ICar;

implementation

function CreateToyotaGarage: ICar;
var
  Garage: TCarGarage;
begin
  Garage := TCarGarage.Create('Toyota Garage');

  Garage.Add(TCar.Create('Toyota Supra'));
  Garage.Add(TCar.Create('Toyota Corolla'));
  Garage.Add(TCar.Create('Toyota Camry'));
  Garage.Add(TCar.Create('Toyota GR86'));
  Garage.Add(TCar.Create('Toyota Yaris'));

  Result := Garage;
end;

end.

