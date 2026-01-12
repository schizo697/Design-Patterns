unit MediaPlayer;

interface

uses
  SysUtils, Generics.Collections;

type
  TMediaPlayer = class
  private
    FQueue: TList<string>;
    FCurrentIndex: Integer;
    FIsPlaying: Boolean;
    procedure ShowCurrentTrack;
  public
    constructor Create;
    destructor Destroy;

    procedure AddToQueue(const Song: string);
    procedure Play;
    procedure Pause;
    procedure Next;
    procedure Previous;
    function HasSong: Boolean;
  end;

implementation

{ TMediaPlayer }

procedure TMediaPlayer.AddToQueue(const Song: string);
begin
  FQueue.Add(Song);
  if FCurrentIndex = -1 then
    FCurrentIndex := 0;
  Writeln('"', Song, '" added to queue.');
end;

constructor TMediaPlayer.Create;
begin
  FQueue := TList<string>.Create;
  FCurrentIndex := -1;
  FIsPlaying := False;
end;

destructor TMediaPlayer.Destroy;
begin
  FQueue.Free;
  inherited;
end;

function TMediaPlayer.HasSong: Boolean;
begin
  Result := FQueue.Count > 0;
end;

procedure TMediaPlayer.Next;
begin
  if not HasSong then
    Writeln('Queue is empty!')
  else
  begin
    FCurrentIndex := (FCurrentIndex + 1) mod FQueue.Count;
    FIsPlaying := True;
    ShowCurrentTrack;
  end;
end;

procedure TMediaPlayer.Pause;
begin
  if FIsPlaying then
  begin
    FIsPlaying := False;
    Writeln('Music paused.');
  end
  else
    Writeln('Music is already paused.');
end;

procedure TMediaPlayer.Play;
begin
  if not HasSong then
    Writeln('Queue is empty')
  else
  begin
    FIsPlaying := True;
    ShowCurrentTrack;
  end;
end;

procedure TMediaPlayer.Previous;
begin
  if not HasSong then
    Writeln('Queue is empty!')
  else
  begin
    FCurrentIndex := (FCurrentIndex - 1 + FQueue.Count) mod FQueue.Count;
    FIsPlaying := True;
    ShowCurrentTrack;
  end;
end;

procedure TMediaPlayer.ShowCurrentTrack;
begin
  if (FCurrentIndex >= 0) and (FCurrentIndex < FQueue.Count) then
    Writeln('Now playing: "', FQueue[FCurrentIndex], '"')
  else
    Writeln('No song in queue');
end;

end.
