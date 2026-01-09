unit AMGCar;

interface

uses
  Car;

type
  TAMGCar = class(TCar)
  public
    function GetBrand: string; override;
    function GetModel: string; override;
    function GetPrice: Integer; override;
  end;

implementation

{ TAMGCar }

function TAMGCar.GetBrand: string;
begin
  Result := 'AMG';
end;

function TAMGCar.GetModel: string;
begin
  Result := 'GT 63 S';
end;

function TAMGCar.GetPrice: Integer;
begin
  Result := 25000;
end;

end.
