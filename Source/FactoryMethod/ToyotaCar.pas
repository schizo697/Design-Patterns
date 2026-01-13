unit ToyotaCar;

interface

uses
  Car;

type
  TToyotaCar = class(TCar)
  public
    function GetBrand: string; override;
    function GetModel: string; override;
    function GetPrice: Integer; override;
  end;

implementation

{ TToyotaCar }

function TToyotaCar.GetBrand: string;
begin
  Result := 'Toyota';
end;

function TToyotaCar.GetModel: string;
begin
  Result := 'Supra';
end;

function TToyotaCar.GetPrice: Integer;
begin
  Result := 20000;
end;

end.
