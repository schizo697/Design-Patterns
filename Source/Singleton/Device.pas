unit Device;

interface

type
  TDevice = class
  public
    Name: string;
    constructor Create(const AName: string);
  end;

implementation

{ TDevice }

constructor TDevice.Create(const AName: string);
begin
  Name := AName;
end;

end.
