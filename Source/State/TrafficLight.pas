unit TrafficLight;

interface

uses
  TrafficLightIntf,
  Car;

type
  TTrafficLight = class
  private
    FCurrentState: ITrafficLightState;
    FGoState: ITrafficLightState;
    FStopState: ITrafficLightState;
    FSlowDownState: ITrafficLightState;
  public
    constructor Create;
    procedure ChangeToGreen;
    procedure ChangeToRed;
    procedure ChangeToOrange;
    function GetCurrentColor: string;
    procedure ApplyToCar(ACar: TCar);
  end;

implementation

uses
  GoState,
  StopState,
  SlowDownState;

{ TTrafficLight }

constructor TTrafficLight.Create;
begin
  inherited;
  FGoState := TGoState.Create;
  FStopState := TStopState.Create;
  FSlowDownState := TSlowDownState.Create;
  FCurrentState := FStopState;
end;

procedure TTrafficLight.ChangeToGreen;
begin
  FCurrentState := FGoState;
end;

procedure TTrafficLight.ChangeToRed;
begin
  FCurrentState := FStopState;
end;

procedure TTrafficLight.ChangeToOrange;
begin
  FCurrentState := FSlowDownState;
end;

function TTrafficLight.GetCurrentColor: string;
begin
  Result := FCurrentState.GetColor;
end;

procedure TTrafficLight.ApplyToCar(ACar: TCar);
begin
  FCurrentState.Handle(ACar);
end;

end.
