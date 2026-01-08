unit SwordBase;

interface

uses
  SysUtils, SwordIntf;

type
  TSword = class
  private
    FBaseDamage: Integer;
    FStrategy: ISword;
  public
    constructor Create(AStrategy: ISword);
    function GetTotalDamage: Integer;
    function GetDescription: string;
    procedure DisplayInfo;
    function GetEffect: string;
  end;

implementation

{ TSword }

constructor TSword.Create(AStrategy: ISword);
begin
  Inherited Create;
  FBaseDamage := 10;
  FStrategy := AStrategy;
end;

procedure TSword.DisplayInfo;
begin
  WriteLn('=================================');
  WriteLn('Sword Type: ', GetDescription);
  WriteLn('Base Damage: ', FBaseDamage);
  WriteLn('Strategy Damage: ', FStrategy.GetDamage);
  WriteLn('Total Damage: ', GetTotalDamage);
  WriteLn('Effect: ', GetEffect);
  WriteLn('=================================');
  WriteLn;
end;

function TSword.GetDescription: string;
begin
  Result := FStrategy.GetDescription;
end;

function TSword.GetEffect: string;
begin
  Result := FStrategy.GetEffect;
end;

function TSword.GetTotalDamage: Integer;
begin
  Result := FBaseDamage + FStrategy.GetDamage;
end;

end.
