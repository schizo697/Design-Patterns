unit SlowDownState;

interface

uses
  TrafficLightIntf,
  Car;

type
  TSlowDownState = class(TInterfacedObject, ITrafficLightState)
  public
    function GetColor: string;
    procedure Handle(ACar: TCar);
  end;

implementation

{ TSlowDownState }

function TSlowDownState.GetColor: string;
begin
  Result := 'ORANGE';
end;

procedure TSlowDownState.Handle(ACar: TCar);
begin
  ACar.SlowDown;
end;

end.
