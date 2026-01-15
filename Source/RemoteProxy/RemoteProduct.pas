unit RemoteProduct;

interface

uses
  ProductIntf;

type
  TRemoteProduct = class(TInterfacedObject, IProduct)
  private
    FRealProduct: IProduct;
  public
    constructor Create(AProduct: IProduct);

    function GetName: string;
    function GetPrice: Double;
  end;

implementation

constructor TRemoteProduct.Create(AProduct: IProduct);
begin
  FRealProduct := AProduct;
end;

function TRemoteProduct.GetName: string;
begin
  Result := FRealProduct.GetName;
end;

function TRemoteProduct.GetPrice: Double;
begin
  Result := FRealProduct.GetPrice;
end;

end.

