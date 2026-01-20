unit SpoilerDecorator;

interface

uses
  Car, CarDecorator;

type
  TSpoilerDecorator = class(TCarDecorator)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TSpoilerDecorator }

function TSpoilerDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription + ', Spoiler';
end;

function TSpoilerDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice + 30000;
end;

end.
