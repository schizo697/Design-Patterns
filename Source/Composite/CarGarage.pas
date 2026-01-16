unit CarGarage;

interface

uses
  Classes, SysUtils, CarIntf, Generics.Collections;

type
  TCarGarage = class(TInterfacedObject, ICar)
  private
    FName: string;
    FCars: TList<ICar>;
  public
    constructor Create(const AName: string);
    destructor Destroy; override;
    procedure Add(Car: ICar);
    procedure Display;
  end;

implementation

constructor TCarGarage.Create(const AName: string);
begin
  FName := AName;
  FCars := TList<ICar>.Create;
end;

destructor TCarGarage.Destroy;
begin
  FCars.Free;
  inherited;
end;

procedure TCarGarage.Add(Car: ICar);
begin
  FCars.Add(Car);
end;

procedure TCarGarage.Display;
var
  Car: ICar;
begin
  Writeln('Garage: ', FName);
  for Car in FCars do
    Car.Display;
end;

end.

