unit Toyota;

interface

uses
  CarRace;

type
  TToyota = class(TCarRace)
  protected
    procedure EngineStart; override;
    procedure Go; override;
    function UseNitro: Boolean; override;
  end;

implementation

{ TToyota }

procedure TToyota.EngineStart;
begin
  Writeln('Toyota engine starts smoothly.');
end;

procedure TToyota.Go;
begin
  Writeln('Toyota engine starts smoothly.');
end;

function TToyota.UseNitro: Boolean;
begin
  Result := True;
end;

end.
