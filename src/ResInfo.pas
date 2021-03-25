unit ResInfo;

interface

uses Classes;

{Class for Objects}

type
  TResInfo = class(TObject)
  private
    FResFlag                : string;
    FResMsg                 : string;
    procedure SetResFlag(const Value: string);
    procedure SetResMsg(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property resFlag       : string          read FResFlag        write SetResFlag;
    property resMsg        : string          read FResMsg         write SetResMsg;
end;

implementation

{ TResInfo }

constructor TResInfo.Create;
begin
  inherited;
end;

destructor TResInfo.Destroy;
begin

  inherited;
end;

procedure TResInfo.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure TResInfo.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;

end.
