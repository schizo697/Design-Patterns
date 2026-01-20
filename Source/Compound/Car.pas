unit Car;

interface

type
  TCar = class
  public
    function GetDescription: string; virtual; abstract;
    function GetPrice: Double; virtual; abstract;
  end;

implementation

end.
