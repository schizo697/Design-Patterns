unit StopState;

interface

uses
  TrafficLightIntf,
  Car;

type
  TStopState = class(TInterfacedObject, ITrafficLightState)
  public
    function GetColor: string;
    procedure Handle(ACar: TCar);
  end;

implementation

{ TStopState }

function TStopState.GetColor: string;
begin
  Result := 'RED';
end;

procedure TStopState.Handle(ACar: TCar);
begin
  ACar.Stop;
end;

end.
