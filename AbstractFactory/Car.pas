unit Car;

interface

uses
  Engine, Transmission, Wheels, Interior;

type
  TCar = class
  private
    FEngine: TEngine;
    FTransmission: TTransmission;
    FWheels: TWheels;
    FInterior: TInterior;
    FBrand: string;
  public
    constructor Create(AEngine: TEngine; ATransmission: TTransmission;
      AWheels: TWheels; AInterior: TInterior; ABrand: string);
    destructor Destroy; override;
    procedure ShowSpecs;
  end;

implementation

{ TCar }

constructor TCar.Create(AEngine: TEngine; ATransmission: TTransmission;
  AWheels: TWheels; AInterior: TInterior; ABrand: string);
begin
  inherited Create;
  FEngine := AEngine;
  FTransmission := ATransmission;
  FWheels := AWheels;
  FInterior := AInterior;
  FBrand := ABrand;
end;

destructor TCar.Destroy;
begin
  FEngine.Free;
  FTransmission.Free;
  FWheels.Free;
  FInterior.Free;
  inherited;
end;

procedure TCar.ShowSpecs;
begin
  Writeln('=== ', FBrand, ' Car Specifications ===');
  FEngine.DisplayInfo;
  FTransmission.DisplayInfo;
  FWheels.DisplayInfo;
  FInterior.DisplayInfo;
  Writeln('====================================');
  Writeln;
end;

end.
