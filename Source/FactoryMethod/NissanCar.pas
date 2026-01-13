unit NissanCar;

interface

uses
  Car;

type
  TNissanCar = class(TCar)
  public
    function GetBrand: string; override;
    function GetModel: string; override;
    function GetPrice: Integer; override;
  end;

implementation

{ TNissanCar }

function TNissanCar.GetBrand: string;
begin
  Result := 'Nissan';
end;

function TNissanCar.GetModel: string;
begin
  Result := 'GTR';
end;

function TNissanCar.GetPrice: Integer;
begin
  Result := 30000;
end;

end.
