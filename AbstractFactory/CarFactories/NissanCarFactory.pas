unit NissanCarFactory;

interface

uses
  CarFactory, Engine, Transmission, Wheels, Interior, NissanEngine,
  NissanTransmission, NissanWheels, NissanInterior;

type
  TNissanCarFactory = class(TInterfacedObject, ICarFactory)
  public
    function CreateEngine: TEngine;
    function CreateTransmission: TTransmission;
    function CreateWheels: TWheels;
    function CreateInterior: TInterior;
  end;

implementation

{ TNissanCarFactory }

function TNissanCarFactory.CreateEngine: TEngine;
begin
  Result := TNissanEngine.Create;
end;

function TNissanCarFactory.CreateInterior: TInterior;
begin
  Result := TNissanInterior.Create;
end;

function TNissanCarFactory.CreateTransmission: TTransmission;
begin
  Result := TNissanTransmission.Create;
end;

function TNissanCarFactory.CreateWheels: TWheels;
begin
  Result := TNissanWheels.Create;
end;

end.
