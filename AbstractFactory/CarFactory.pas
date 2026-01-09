unit CarFactory;

interface

uses
  Engine, Transmission, Wheels, Interior;

type
  ICarFactory = interface
    ['{E0D65355-4DA7-4189-9A68-8D1263A9FDFB}']
    function CreateEngine: TEngine;
    function CreateTransmission: TTransmission;
    function CreateWheels: TWheels;
    function CreateInterior: TInterior;
  end;

implementation

end.
