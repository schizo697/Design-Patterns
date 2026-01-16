unit GoState;

interface

uses
  TrafficLightIntf,
  Car;

type
  TGoState = class(TInterfacedObject, ITrafficLightState)
  public
    function GetColor: string;
    procedure Handle(ACar: TCar);
  end;

implementation

{ TGoState }

function TGoState.GetColor: string;
begin
  Result := 'GREEN';
end;

procedure TGoState.Handle(ACar: TCar);
begin
  ACar.Go;
end;

end.
