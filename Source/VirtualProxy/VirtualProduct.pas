unit VirtualProduct;

interface

uses
  ProductIntf;

type
  TVirtualProduct = class(TInterfacedObject, IProduct)
  private
    FRealProduct: IProduct;
    FName: string;
    FPrice: Double;

    procedure EnsureProductCreated;
  public
    constructor Create(const AName: string; APrice: Double);

    function GetName: string;
    function GetPrice: Double;
  end;

implementation

uses
  Product;

constructor TVirtualProduct.Create(const AName: string; APrice: Double);
begin
  FName := AName;
  FPrice := APrice;
  FRealProduct := nil;
end;

procedure TVirtualProduct.EnsureProductCreated;
begin
  if FRealProduct = nil then
  begin
    Writeln('>> Creating real product now...');
    FRealProduct := TProduct.Create(FName, FPrice);
  end;
end;

function TVirtualProduct.GetName: string;
begin
  EnsureProductCreated;
  Result := FRealProduct.GetName;
end;

function TVirtualProduct.GetPrice: Double;
begin
  EnsureProductCreated;
  Result := FRealProduct.GetPrice;
end;

end.

