unit TurboDecorator;

interface

uses
  Car, CarDecorator;

type
  TTurboDecorator = class(TCarDecorator)
  public
    function GetDescription: string; override;
    function GetPrice: Double; override;
  end;

implementation

{ TTurboDecorator }

function TTurboDecorator.GetDescription: string;
begin
  Result := FCar.GetDescription + ', Turbo';
end;

function TTurboDecorator.GetPrice: Double;
begin
  Result := FCar.GetPrice + 120000;
end;

end.
