unit Transmission;

interface

type
  TTransmission = class
  public
    function GetSpecs: string; virtual; abstract;
    procedure DisplayInfo;
  end;

implementation

{ TTransmission }

procedure TTransmission.DisplayInfo;
begin
  Writeln('Transmission ', GetSpecs);
end;

end.
