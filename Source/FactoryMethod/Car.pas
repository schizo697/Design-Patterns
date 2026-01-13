unit Car;

interface

type
  TCar = class
  public
    function GetBrand: string; virtual; abstract;
    function GetModel: string; virtual; abstract;
    function GetPrice: Integer; virtual; abstract;
    procedure DisplayInfo; virtual;
  end;

implementation

{ TCar }

procedure TCar.DisplayInfo;
begin
  Writeln('Brand: ', GetBrand);
  Writeln('Model: ', GetModel);
  Writeln('Price ', GetPrice);
  Writeln('---------------------------');
end;

end.
