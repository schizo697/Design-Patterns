unit Engine;

interface

type
  TEngine = class
  private
    FIsPowered: Boolean;
    FIsRunning: Boolean;
  public
    constructor Create;

    procedure PowerOn;
    procedure PowerOff;
    procedure Start;
    procedure Stop;

    function IsPowered: Boolean;
    function IsRunning: Boolean;
  end;

implementation

uses
  System.SysUtils;

constructor TEngine.Create;
begin
  FIsPowered := False;
  FIsRunning := False;
end;

procedure TEngine.PowerOn;
begin
  if not FIsPowered then
  begin
    FIsPowered := True;
    Writeln('Engine powered on (ignition on)');
  end
  else
    Writeln('Engine already powered');
end;

procedure TEngine.PowerOff;
begin
  if FIsRunning then
    Stop;

  if FIsPowered then
  begin
    FIsPowered := False;
    Writeln('Engine powered off (ignition off)');
  end
  else
    Writeln('Engine already off');
end;

procedure TEngine.Start;
begin
  if not FIsPowered then
    Writeln('Cannot start: Engine not powered')
  else if not FIsRunning then
  begin
    FIsRunning := True;
    Writeln('Engine started (running)');
  end
  else
    Writeln('Engine already running');
end;

procedure TEngine.Stop;
begin
  if FIsRunning then
  begin
    FIsRunning := False;
    Writeln('Engine stopped');
  end
  else
    Writeln('Engine is not running');
end;

function TEngine.IsPowered: Boolean;
begin
  Result := FIsPowered;
end;

function TEngine.IsRunning: Boolean;
begin
  Result := FIsRunning;
end;

end.

