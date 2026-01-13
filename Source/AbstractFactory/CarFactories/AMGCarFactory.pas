unit AMGCarFactory;

interface

uses
  CarFactory, Engine, Transmission, Wheels, Interior, AMGEngine,
  AMGTransmission, AMGWheels, AMGInterior;

type
  TAMGCarFactory = class(TInterfacedObject, ICarFactory)
  public
    function CreateEngine: TEngine;
    function CreateTransmission: TTransmission;
    function CreateWheels: TWheels;
    function CreateInterior: TInterior;
  end;

implementation

{ TAMGCarFactory }

function TAMGCarFactory.CreateEngine: TEngine;
begin
  Result := TAMGEngine.Create;
end;

function TAMGCarFactory.CreateInterior: TInterior;
begin
  Result := TAMGInterior.Create;
end;

function TAMGCarFactory.CreateTransmission: TTransmission;
begin
  Result := TAMGTransmission.Create;
end;

function TAMGCarFactory.CreateWheels: TWheels;
begin
  Result := TAMGWheels.Create;
end;

end.
