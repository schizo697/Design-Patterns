unit RacingWheelsDecorator;

interface

uses Car, CarDecorator;

type
  TRacingWheelsDecorator = class(TCarDecorator)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

function TRacingWheelsDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription + ', Racing Wheels';
end;

function TRacingWheelsDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice + 30000;
end;

end.

