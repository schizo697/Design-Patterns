unit Laptop;

interface

uses
  EUChargerIntf;

type
  TLaptop = class
  public
    procedure Charge(Charger: IEUCharger);
  end;

implementation

procedure TLaptop.Charge(Charger: IEUCharger);
begin
  Writeln('Laptop charging using EU charger...');
  Charger.PlugIntoEUSocket;
end;

end.

