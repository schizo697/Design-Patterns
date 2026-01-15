program VirtualProxy;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ProductIntf in 'ProductIntf.pas',
  Product in 'Product.pas',
  VirtualProduct in 'VirtualProduct.pas';

var
  ProductProxy: IProduct;
  ProductName: string;
  ProductPrice: Double;
begin
  Writeln('=== Product Entry ===');

  Write('Enter product name: ');
  Readln(ProductName);

  Write('Enter product price: ');
  Readln(ProductPrice);

  ProductProxy := TVirtualProduct.Create(ProductName, ProductPrice);

  Writeln('Name : ', ProductProxy.GetName);
  Writeln('Price: ', ProductProxy.GetPrice:0:2);
  Readln;
end.
