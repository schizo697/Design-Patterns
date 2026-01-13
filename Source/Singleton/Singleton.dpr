program Singleton;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ServerListener in 'ServerListener.pas',
  Device in 'Device.pas';

var
  Choice: Integer;
  DeviceName: string;

begin
  try
    TServerListener.Instance.Start(8080);

    repeat
      Writeln;
      Writeln('=== Server Menu ===');
      Writeln('1. Add Device');
      Writeln('2. Disconnect Device');
      Writeln('3. List Devices');
      Writeln('0. Exit');
      Write('Choice: ');
      Readln(Choice);

      case Choice of
        1:
          begin
            Write('Enter device name: ');
            Readln(DeviceName);
            TServerListener.Instance.AddDevice(DeviceName);
          end;
        2:
          begin
            Write('Enter device name to disconnect: ');
            Readln(DeviceName);
            TServerListener.Instance.DisconnectDevice(DeviceName);
          end;
        3:
          begin
            TServerListener.Instance.ListDevices;
          end;
      end;

    until Choice = 0;

    TServerListener.Instance.Stop;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
