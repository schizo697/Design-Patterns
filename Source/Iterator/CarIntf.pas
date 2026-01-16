unit CarIntf;

interface

uses
  Car;

type
  ICar = interface
    function HasNext: Boolean;
    function Next: TCar;
  end;

implementation

end.
