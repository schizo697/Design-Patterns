unit MagsDecorator;

interface

uses
  Car, CarDecorator;

type
  TMagsDecorator = class(TCarDecorator)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TMagsDecorator }

function TMagsDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription + ', Mags';
end;

function TMagsDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice + 20000;
end;

end.
