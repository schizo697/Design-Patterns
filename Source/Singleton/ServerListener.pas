unit ServerListener;

interface

uses
  SysUtils, Classes, SyncObjs, IdTCPServer, IdContext, Generics.Collections, Device;

type
  TServerListener = class
  private
    class var FInstance: TServerListener;
    class var FLock: TCriticalSection;

    FTCPServer: TIdTCPServer;
    FDevices: TList<TDevice>;

    constructor CreatePrivate;

    procedure OnConnect(AContext: TIdContext);
    procedure OnDisconnect(AContext: TIdContext);
    procedure OnExecute(AContext: TIdContext);

  public
    class function Instance: TServerListener;

    procedure Start(APort: Integer);
    procedure Stop;

    procedure AddDevice(const AName: string);
    procedure DisconnectDevice(const AName: string);
    procedure ListDevices;

    destructor Destroy; override;
  end;

implementation

{ TServerListener }

procedure TServerListener.AddDevice(const AName: string);
var
  Dev: TDevice;
begin
  Dev := TDevice.Create(AName);
  FDevices.Add(Dev);
  Writeln(AName, ' added and connected.');
end;

constructor TServerListener.CreatePrivate;
begin
  FTCPServer := TIdTCPServer.Create(nil);
  FTCPServer.OnConnect := OnConnect;
  FTCPServer.OnDisconnect := OnDisconnect;
  FTCPServer.OnExecute := OnExecute;

  FDevices := TList<TDevice>.Create;
end;

destructor TServerListener.Destroy;
begin
  Stop;
  FDevices.Free;
  FTCPServer.Free;
  inherited;
end;

procedure TServerListener.DisconnectDevice(const AName: string);
var
  Dev: TDevice;
begin
  for Dev in FDevices do
    if Dev.Name = AName then
    begin
      FDevices.Remove(Dev);
      Writeln(AName, ' disconnected.');
      Dev.Free;
      Exit;
    end;
  Writeln('Device ', AName, ' not found.');
end;

class function TServerListener.Instance: TServerListener;
begin
  if FInstance = nil then
  begin
    FLock.Acquire;
    try
      if FInstance = nil then
        FInstance := TServerListener.CreatePrivate;
    finally
      FLock.Release;
    end;
  end;
  Result := FInstance;
end;

procedure TServerListener.ListDevices;
var
  Dev: TDevice;
begin
  if FDevices.Count = 0 then
  begin
    Writeln('No devices connected.');
    Exit;
  end;

  Writeln('Connected devices:');
  for Dev in FDevices do
    Writeln('- ', Dev.Name);
end;

procedure TServerListener.OnConnect(AContext: TIdContext);
begin
  Writeln('Device connected: ', AContext.Binding.PeerIP);
end;

procedure TServerListener.OnDisconnect(AContext: TIdContext);
begin
  Writeln('Device disconnected: ', AContext.Binding.PeerIP);
end;

procedure TServerListener.OnExecute(AContext: TIdContext);
begin
  AContext.Connection.IOHandler.WriteLn('Connected to server.');
  AContext.Connection.Disconnect;
end;

procedure TServerListener.Start(APort: Integer);
begin
  if FTCPServer.Active then Exit;

  FTCPServer.DefaultPort := APort;
  FTCPServer.Active := True;

  Writeln('Server listening on port ', APort);
end;

procedure TServerListener.Stop;
begin
  if FTCPServer.Active then
  begin
    FTCPServer.Active := False;
    Writeln('Server stopped');
  end;
end;

initialization
  TServerListener.FLock := TCriticalSection.Create;

finalization
  TServerListener.FLock.Free;


end.
