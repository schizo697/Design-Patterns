unit ProductIntf;

interface

type
  IProduct = interface
    ['{CB6799C1-7478-4B25-BCC8-ABA70D348E6E}']
    function GetName: string;
    function GetPrice: Double;
  end;

implementation

end.
