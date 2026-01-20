unit CarDecorator;

interface

uses
  Car;

type
  TCarDecorator = class(TCar)
  protected
    FCar: TCar;
  public
    constructor Create(ACar: TCar);

    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TCarDecorator }

constructor TCarDecorator.Create(ACar: TCar);
begin
  FCar := ACar;
end;

function TCarDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription;
end;

function TCarDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice;
end;

end.
