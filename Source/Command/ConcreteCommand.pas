unit ConcreteCommand;

interface

uses
  CommandIntf, MediaPlayer;

type
  TPlayCommand = class(TInterfacedObject, ICommand)
  private
    FPlayer: TMediaPlayer;
  public
    constructor Create(APlayer: TMediaPlayer);
    procedure Execute;
  end;

  TPauseCommand = class(TInterfacedObject, ICommand)
  private
    FPlayer: TMediaPlayer;
  public
    constructor Create(APlayer: TMediaPlayer);
    procedure Execute;
  end;

  TNextCommand = class(TInterfacedObject, ICommand)
  private
    FPlayer: TMediaPlayer;
  public
    constructor Create(APlayer: TMediaPlayer);
    procedure Execute;
  end;

  TBackCommand = class(TInterfacedObject, ICommand)
  private
    FPlayer: TMediaPlayer;
  public
    constructor Create(APlayer: TMediaPlayer);
    procedure Execute;
  end;

implementation

{ TPlayCommand }
constructor TPlayCommand.Create(APlayer: TMediaPlayer);
begin
  FPlayer := APlayer;
end;

procedure TPlayCommand.Execute;
begin
  FPlayer.Play;
end;

{ TPauseCommand }
constructor TPauseCommand.Create(APlayer: TMediaPlayer);
begin
  FPlayer := APlayer;
end;

procedure TPauseCommand.Execute;
begin
  FPlayer.Pause;
end;

{ TNextCommand }
constructor TNextCommand.Create(APlayer: TMediaPlayer);
begin
  FPlayer := APlayer;
end;

procedure TNextCommand.Execute;
begin
  FPlayer.Next;
end;

{ TBackCommand }
constructor TBackCommand.Create(APlayer: TMediaPlayer);
begin
  FPlayer := APlayer;
end;

procedure TBackCommand.Execute;
begin
  FPlayer.Previous;
end;

end.

