unit NissanGarage;

interface

uses
  System.Generics.Collections,
  Car,
  CarIntf;

type
  TNissanGarage = class
  private
    FCars: TList<TCar>;
  public
    constructor Create;
    destructor Destroy; override;
    function CreateIterator: ICar;
  end;

implementation

type
  TNissanIterator = class(TInterfacedObject, ICar)
  private
    FPosition: Integer;
    FCars: TList<TCar>;
  public
    constructor Create(ACars: TList<TCar>);
    function HasNext: Boolean;
    function Next: TCar;
  end;

constructor TNissanGarage.Create;
begin
  FCars := TList<TCar>.Create;

  FCars.Add(TCar.Create('Nissan GTR'));
  FCars.Add(TCar.Create('Nissan Skyline'));
  FCars.Add(TCar.Create('Nissan 350Z'));
  FCars.Add(TCar.Create('Nissan 370Z'));
  FCars.Add(TCar.Create('Nissan Patrol'));
  FCars.Add(TCar.Create('Nissan Navara'));
  FCars.Add(TCar.Create('Nissan Sentra'));
  FCars.Add(TCar.Create('Nissan X-Trail'));
end;

destructor TNissanGarage.Destroy;
begin
  FCars.Free;
  inherited;
end;

function TNissanGarage.CreateIterator: ICar;
begin
  Result := TNissanIterator.Create(FCars);
end;

constructor TNissanIterator.Create(ACars: TList<TCar>);
begin
  FCars := ACars;
  FPosition := 0;
end;

function TNissanIterator.HasNext: Boolean;
begin
  Result := FPosition < FCars.Count;
end;

function TNissanIterator.Next: TCar;
begin
  Result := FCars[FPosition];
  Inc(FPosition);
end;

end.

