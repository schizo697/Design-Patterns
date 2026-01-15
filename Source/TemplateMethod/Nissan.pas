unit Nissan;

interface

uses
  CarRace;

type
  TNissan = class(TCarRace)
    protected
    procedure EngineStart; override;
    procedure Go; override;
    function UseNitro: Boolean; override;
  end;

implementation

{ TNissan }

procedure TNissan.EngineStart;
begin
  Writeln('Nissan engine roars!');
end;

procedure TNissan.Go;
begin
  Writeln('Nissan goes full speed!');
end;

function TNissan.UseNitro: Boolean;
begin
  Result := True;
end;

end.
