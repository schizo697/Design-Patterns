unit ToyotaGarage;

interface

uses
  Car,
  CarIntf;

type
  TToyotaGarage = class
  private
    FCars: array of TCar;
  public
    constructor Create;
    function CreateIterator: ICar;
  end;

implementation

type
  TToyotaIterator = class(TInterfacedObject, ICar)
  private
    FPosition: Integer;
    FCars: array of TCar;
  public
    constructor Create(const ACars: array of TCar);
    function HasNext: Boolean;
    function Next: TCar;
  end;

constructor TToyotaGarage.Create;
begin
  SetLength(FCars, 6);

  FCars[0] := TCar.Create('Toyota Supra');
  FCars[1] := TCar.Create('Toyota AE86');
  FCars[2] := TCar.Create('Toyota Corolla');
  FCars[3] := TCar.Create('Toyota Camry');
  FCars[4] := TCar.Create('Toyota Fortuner');
  FCars[5] := TCar.Create('Toyota Land Cruiser');
end;

function TToyotaGarage.CreateIterator: ICar;
begin
  Result := TToyotaIterator.Create(FCars);
end;

constructor TToyotaIterator.Create(const ACars: array of TCar);
var
  I: Integer;
begin
  SetLength(FCars, Length(ACars));
  for I := 0 to High(ACars) do
    FCars[I] := ACars[I];

  FPosition := 0;
end;

function TToyotaIterator.HasNext: Boolean;
begin
  Result := FPosition < Length(FCars);
end;

function TToyotaIterator.Next: TCar;
begin
  Result := FCars[FPosition];
  Inc(FPosition);
end;

end.

