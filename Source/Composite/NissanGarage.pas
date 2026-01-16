unit NissanGarage;

interface

uses
  CarGarage, Car, CarIntf, SysUtils;

function CreateNissanGarage: ICar;

implementation

function CreateNissanGarage: ICar;
var
  Garage: TCarGarage;
begin
  Garage := TCarGarage.Create('Nissan Garage');

  Garage.Add(TCar.Create('Nissan GT-R'));
  Garage.Add(TCar.Create('Nissan Skyline'));
  Garage.Add(TCar.Create('Nissan R32'));
  Garage.Add(TCar.Create('Nissan 370Z'));
  Garage.Add(TCar.Create('Nissan Juke'));

  Result := Garage;
end;

end.

