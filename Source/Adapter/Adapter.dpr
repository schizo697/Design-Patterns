program Adapter;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  EUChargerIntf in 'EUChargerIntf.pas',
  UKOutlet in 'UKOutlet.pas',
  UKToEUAdapter in 'UKToEUAdapter.pas',
  Laptop in 'Laptop.pas';


var
  Laptop: TLaptop;
  UKOutlet: TUKOutlet;
  ChargerAdapter: IEUCharger;
begin
  Laptop := TLaptop.Create;
  UKOutlet := TUKOutlet.Create;

  ChargerAdapter := TUKToEUAdapter.Create(UKOutlet);

  Laptop.Charge(ChargerAdapter);

  Readln;
end.

