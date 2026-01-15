unit ProductIntf;

interface

type
  IProduct = interface
    ['{0A213CE5-F6F4-4B0B-8E7B-7FAEF5D1823B}']
    function GetName: string;
    function GetPrice: Double;
  end;

implementation

end.
