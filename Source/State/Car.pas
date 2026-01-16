unit Car;

interface

type
  TCar = class
  private
    FSpeed: Integer;
    FIsMoving: Boolean;
  public
    constructor Create;
    procedure Go;
    procedure Stop;
    procedure SlowDown;
    function GetStatus: string;
    property Speed: Integer read FSpeed;
    property IsMoving: Boolean read FIsMoving;
  end;

implementation

uses
  SysUtils;

{ TCar }

constructor TCar.Create;
begin
  inherited;
  FSpeed := 0;
  FIsMoving := False;
end;

procedure TCar.Go;
begin
  FSpeed := 60;
  FIsMoving := True;
end;

procedure TCar.Stop;
begin
  FSpeed := 0;
  FIsMoving := False;
end;

procedure TCar.SlowDown;
begin
  FSpeed := 20;
  FIsMoving := True;
end;

function TCar.GetStatus: string;
begin
  if FIsMoving then
    Result := Format('Car is moving at %d km/h', [FSpeed])
  else
    Result := 'Car is stopped';
end;

end.
