unit CarFacade;

interface

uses
  Engine,
  ElectricalSystem,
  ACSystem;

type
  TCarFacade = class
  private
    FEngine: TEngine;
    FElectrical: TElectricalSystem;
    FAC: TACSystem;
  public
    constructor Create;
    destructor Destroy; override;

    procedure TurnOn;
    procedure TurnOff;
    procedure Run;
    procedure Stop;
  end;

implementation

constructor TCarFacade.Create;
begin
  FAC := TACSystem.Create;
  FElectrical := TElectricalSystem.Create(FAC);
  FEngine := TEngine.Create;
end;

destructor TCarFacade.Destroy;
begin
  FEngine.Free;
  FElectrical.Free;
  FAC.Free;
  inherited;
end;

procedure TCarFacade.TurnOn;
begin
  FElectrical.PowerOn;
  FEngine.PowerOn;
  Writeln('Car is now powered.');
end;

procedure TCarFacade.TurnOff;
begin
  FEngine.PowerOff;
  FElectrical.PowerOff;
  Writeln('Car is now turned off.');
end;

procedure TCarFacade.Run;
begin
  FEngine.Start;
end;

procedure TCarFacade.Stop;
begin
  FEngine.Stop;
end;

end.

