unit EngineDecorator;

interface

uses
  Car, CarDecorator;

type
  TEngineDecorator = class(TCarDecorator)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TEngineDecorator }

function TEngineDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription + ', Upgraded Engine';
end;

function TEngineDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice + 50000;
end;

end.
