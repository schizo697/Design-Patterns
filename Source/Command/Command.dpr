program Command;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CommandIntf in 'CommandIntf.pas',
  MediaPlayer in 'MediaPlayer.pas',
  ConcreteCommand in 'ConcreteCommand.pas',
  Invoker in 'Invoker.pas';

var
  Player: TMediaPlayer;
  PlayButton, PauseButton, NextButton, BackButton: TButton;
  Input, Song: string;

begin
  Player := TMediaPlayer.Create;
  PlayButton := TButton.Create;
  PauseButton := TButton.Create;
  NextButton := TButton.Create;
  BackButton := TButton.Create;

  PlayButton.SetCommand(TPlayCommand.Create(Player));
  PauseButton.SetCommand(TPauseCommand.Create(Player));
  NextButton.SetCommand(TNextCommand.Create(Player));
  BackButton.SetCommand(TBackCommand.Create(Player));

  Writeln('--- Interactive Media Player ---');
  Writeln('Commands: add, play, pause, next, back, exit');

  repeat
    Write('> ');
    Readln(Input);
    Input := LowerCase(Input);

    if Input = 'add' then
    begin
      Write('Enter song name: ');
      Readln(Song);
      Player.AddToQueue(Song);
    end
    else if Input = 'play' then
      PlayButton.Press
    else if Input = 'pause' then
      PauseButton.Press
    else if Input = 'next' then
      NextButton.Press
    else if Input = 'back' then
      BackButton.Press
    else if Input <> 'exit' then
      Writeln('Unknown command. Try: add, play, pause, next, back, exit.');

  until Input = 'exit';

  Writeln('Exiting media player...');

end.
