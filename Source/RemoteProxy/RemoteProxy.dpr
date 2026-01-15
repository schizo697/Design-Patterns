program RemoteProxy;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ProductIntf in 'ProductIntf.pas',
  Product in 'Product.pas',
  RemoteProduct in 'RemoteProduct.pas';

var
  RealProduct: IProduct;
  ProxyProduct: IProduct;
  ProductName: string;
  ProductPrice: Double;
begin
  Writeln('=== Product Entry ===');

  Write('Enter product name: ');
  Readln(ProductName);

  Write('Enter product price: ');
  Readln(ProductPrice);

  RealProduct := TProduct.Create(ProductName, ProductPrice);

  ProxyProduct := TRemoteProduct.Create(RealProduct);

  Writeln;
  Writeln('=== Product Display ===');
  Writeln('Name : ', ProxyProduct.GetName);
  Writeln('Price: ', ProxyProduct.GetPrice:0:2);

  Readln;
end.
