unit ACSystem;

interface

type
  TACSystem = class
  private
    FIsOn: Boolean;
  public
    constructor Create;
    procedure TurnOn;
    procedure TurnOff;
    function IsOn: Boolean;
  end;

implementation

uses
  System.SysUtils;

constructor TACSystem.Create;
begin
  FIsOn := False;
end;

procedure TACSystem.TurnOn;
begin
  if not FIsOn then
  begin
    FIsOn := True;
    Writeln('AC system turned on');
  end
  else
    Writeln('AC system already on');
end;

procedure TACSystem.TurnOff;
begin
  if FIsOn then
  begin
    FIsOn := False;
    Writeln('AC system turned off');
  end
  else
    Writeln('AC system already off');
end;

function TACSystem.IsOn: Boolean;
begin
  Result := FIsOn;
end;

end.

