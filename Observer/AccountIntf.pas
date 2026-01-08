unit AccountIntf;

interface

['{D6EFB694-B236-4476-9EF2-6019EE90624F}']
type
  IAccount = interface
  procedure Update(ACoinPrice: Double);
  function GetName: string;
  end;

implementation

end.
