unit TrafficLightIntf;

interface

uses
  Car;

type
  ITrafficLightState = interface
    ['{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}']
    function GetColor: string;
    procedure Handle(ACar: TCar);
  end;

implementation

end.
