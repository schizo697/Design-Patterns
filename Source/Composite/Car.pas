unit Car;

interface

uses
  CarIntf, SysUtils;

type
  TCar = class(TInterfacedObject, ICar)
  private
    FName: string;
  public
    constructor Create(const AName: string);
    procedure Display;
  end;

implementation

constructor TCar.Create(const AName: string);
begin
  FName := AName;
end;

procedure TCar.Display;
begin
  Writeln('Car: ', FName);
end;

end.

