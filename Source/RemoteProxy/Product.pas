unit Product;

interface

uses
  ProductIntf;

type
  TProduct = class(TInterfacedObject, IProduct)
  private
    FName: string;
    FPrice: Double;
  public
    constructor Create(const AName: string; APrice: Double);

    function GetName: string;
    function GetPrice: Double;
  end;

implementation

{ TProduct }

constructor TProduct.Create(const AName: string; APrice: Double);
begin
  FName := AName;
  FPrice := APrice;
end;

function TProduct.GetName: string;
begin
  Result := FName;
end;

function TProduct.GetPrice: Double;
begin
  Result := FPrice;
end;

end.
