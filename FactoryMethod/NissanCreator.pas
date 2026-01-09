unit NissanCreator;

interface

uses
  CarCreator, Car, NissanCar;

type
  TNissanCreator = class(TCarCreator)
  public
    function CreateCar: TCar; override;
  end;

implementation

{ TNissanCreator }

function TNissanCreator.CreateCar: TCar;
begin
  Result := TNissanCar.Create;
end;

end.
