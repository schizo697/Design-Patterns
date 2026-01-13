unit ToyotaCreator;

interface

uses
  CarCreator, Car, ToyotaCar;

type
  TToyotaCreator = class(TCarCreator)
  public
    function CreateCar: TCar; override;
  end;

implementation

{ TToyotaCreator }

function TToyotaCreator.CreateCar: TCar;
begin
  Result := TToyotaCar.Create;
end;

end.
