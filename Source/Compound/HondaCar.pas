unit HondaCar;

interface

uses
  Car;

type
  THondaCar = class(TCar)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ THondaCar }

function THondaCar.GetDescription: string;
begin
  Result := 'Honda'
end;

function THondaCar.GetPrice: Double;
begin
  Result := 900000;
end;

end.
