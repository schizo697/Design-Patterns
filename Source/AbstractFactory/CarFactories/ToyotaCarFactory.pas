unit ToyotaCarFactory;

interface

uses
  CarFactory, Engine, Transmission, Wheels, Interior, ToyotaEngine,
  ToyotaTransmission, ToyotaWheels, ToyotaInterior;

type
  TToyotaCarFactory = class(TInterfacedObject, ICarFactory)
  public
    function CreateEngine: TEngine;
    function CreateTransmission: TTransmission;
    function CreateWheels: TWheels;
    function CreateInterior: TInterior;
  end;

implementation

{ TToyotaCarFactory }

function TToyotaCarFactory.CreateEngine: TEngine;
begin
  Result := TToyotaEngine.Create;
end;

function TToyotaCarFactory.CreateInterior: TInterior;
begin
  Result := TToyotaInterior.Create;
end;

function TToyotaCarFactory.CreateTransmission: TTransmission;
begin
  Result := TToyotaTransmission.Create;
end;

function TToyotaCarFactory.CreateWheels: TWheels;
begin
  Result := TToyotaWheels.Create;
end;

end.
