unit CarRace;

interface

type
  TCarRace = class
  public
    procedure Run;
  protected
    procedure EngineStart; virtual; abstract;
    procedure Go; virtual; abstract;

    procedure Drive;

    function UseNitro: Boolean; virtual;
  end;

implementation

{ TCarRace }

procedure TCarRace.Run;
begin
  EngineStart;
  Go;
  Drive;

  if UseNitro then
    Writeln('Nitro activated!');

  Writeln('Finished!');
end;

procedure TCarRace.Drive;
begin
  Writeln('Zooming straight down the track...');
end;

function TCarRace.UseNitro: Boolean;
begin
  Result := False;
end;

end.
