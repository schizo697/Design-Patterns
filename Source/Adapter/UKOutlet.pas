unit UKOutlet;

interface

type
  TUKOutlet = class
  public
    procedure PlugIntoUKSocket;
  end;

implementation

{ TUKOutlet }

procedure TUKOutlet.PlugIntoUKSocket;
begin
  Writeln('Plugged into UK outlet with 3 flat pins');
end;

end.
