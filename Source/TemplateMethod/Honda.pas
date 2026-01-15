unit Honda;

interface

uses
  CarRace;

type
  THonda = class(TCarRace)
  protected
    procedure EngineStart; override;
    procedure Go; override;
    function UseNitro: Boolean; override;
  end;

implementation

{ THonda }

procedure THonda.EngineStart;
begin
  Writeln('Honda engine fires up!');
end;

procedure THonda.Go;
begin
  Writeln('Honda accelerates quickly!');
end;

function THonda.UseNitro: Boolean;
begin
  Result := True;
end;

end.
