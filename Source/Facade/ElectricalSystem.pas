unit ElectricalSystem;

interface

uses
  ACSystem;

type
  TElectricalSystem = class
  private
    FAC: TACSystem;
    FIsOn: Boolean;
  public
    constructor Create(AAC: TACSystem);
    procedure PowerOn;   // now powers AC internally
    procedure PowerOff;  // shuts down AC internally
    function IsOn: Boolean;
  end;

implementation

uses
  System.SysUtils;

constructor TElectricalSystem.Create(AAC: TACSystem);
begin
  FAC := AAC;
  FIsOn := False;
end;

procedure TElectricalSystem.PowerOn;
begin
  if not FIsOn then
  begin
    FIsOn := True;
    Writeln('Electrical system powered on');
    FAC.TurnOn;  // AC turns on automatically
  end
  else
    Writeln('Electrical system already on');
end;

procedure TElectricalSystem.PowerOff;
begin
  if FIsOn then
  begin
    FIsOn := False;
    Writeln('Electrical system powered off');
    FAC.TurnOff; // AC turns off automatically
  end
  else
    Writeln('Electrical system already off');
end;

function TElectricalSystem.IsOn: Boolean;
begin
  Result := FIsOn;
end;

end.

