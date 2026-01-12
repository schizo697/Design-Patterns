unit Invoker;

interface

uses
  CommandIntf;

type
  TButton = class
  private
    FCommand: ICommand;
  public
    procedure SetCommand(ACommand: ICommand);
    procedure Press;
  end;

implementation

procedure TButton.SetCommand(ACommand: ICommand);
begin
  FCommand := ACommand;
end;

procedure TButton.Press;
begin
  if Assigned(FCommand) then
    FCommand.Execute;
end;

end.

