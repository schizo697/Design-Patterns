unit ObsCoin;

interface

uses
  System.Generics.Collections, SysUtils, AccountIntf;

type
  TObsCoin = class
  private
    FPrice: Double;
    FObservers: TList<IAccount>;
    procedure NotifyObservers;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Attach(AObserver: IAccount);
    procedure DetachByName(const AName: string);

    procedure IncreasePrice;
    procedure DecreasePrice;

    property Price: Double read FPrice;
  end;

implementation

{ TObsCoin }

constructor TObsCoin.Create;
begin
  FPrice := 1.0;
  FObservers := TList<IAccount>.Create;
end;

destructor TObsCoin.Destroy;
begin
  FObservers.Free;
  inherited;
end;

procedure TObsCoin.Attach(AObserver: IAccount);
begin
  FObservers.Add(AObserver);
end;

procedure TObsCoin.NotifyObservers;
var
  Observer: IAccount;
begin
  for Observer in FObservers do
    Observer.Update(FPrice);
end;

procedure TObsCoin.IncreasePrice;
var
  ChangeFactor: Double;
begin
  ChangeFactor := Random(10) + 1;
  FPrice := FPrice + (FPrice * (ChangeFactor / 100));

  NotifyObservers;
end;

procedure TObsCoin.DecreasePrice;
var
  ChangeFactor: Double;
begin
  ChangeFactor := Random(10) + 1;
  FPrice := FPrice - (FPrice * (ChangeFactor / 100));

  NotifyObservers;
end;

procedure TObsCoin.DetachByName(const AName: string);
var
  Observer: IAccount;
begin
  for Observer in FObservers do
  begin
    if SameText(Observer.GetName, AName) then
    begin
      FObservers.Remove(Observer);
      Writeln('Account "', AName, '" detached.');
      Exit;
    end;
  end;

  Writeln('Account not found.');
end;

end.
