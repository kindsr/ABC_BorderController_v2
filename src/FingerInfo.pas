{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit FingerInfo;

interface

uses Classes;

{Class for Objects}

type
  TFNIObj = class(TObject)
  private
    FRegNo                  : string;
    FPassNo                 : string;
    FBirth                  : string;
    FLeftFingerIndex        : string;
    FRightFingerIndex       : string;
    FLeftFingerImg          : string;
    FRightFingerImg         : string;
    FLeftFingerSpec         : string;
    FRightFingerSpec        : string;
    FLeftQuality            : Integer;
    FRightQuality           : Integer;
    FCreateId               : string;
    FCreateDtm              : TDateTime;
    FProcId                 : string;
    FProcDtm                : TDateTime;
    FFlagType               : string;
    FResFlag                : string;
    FResMsg                 : string;
    procedure SetRegNo(const Value: string);
    procedure SetPassNo(const Value: string);
    procedure SetBirth(const Value: string);
    procedure SetLeftFingerIndex(const Value: string);
    procedure SetRightFingerIndex(const Value: string);
    procedure SetLeftFingerImg(const Value: string);
    procedure SetRightFingerImg(const Value: string);
    procedure SetLeftFingerSpec(const Value: string);
    procedure SetRightFingerSpec(const Value: string);
    procedure SetLeftQuality(const Value: Integer);
    procedure SetRightQuality(const Value: Integer);
    procedure SetCreateId(const Value: string);
    procedure SetCreateDtm(const Value: TDateTime);
    procedure SetProcId(const Value: string);
    procedure SetProcDtm(const Value: TDateTime);
    procedure SetFlagType(const Value: string);
    procedure SetResFlag(const Value: string);
    procedure SetResMsg(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property regNo              : string          read FRegNo                 write SetRegNo;
    property passNo             : string          read FPassNo                write SetPassNo;
    property birth              : string          read FBirth                 write SetBirth;
    property leftFingerIndex    : string          read FLeftFingerIndex       write SetLeftFingerIndex;
    property rightFingerIndex   : string          read FRightFingerIndex      write SetRightFingerIndex;
    property leftFingerImg      : string          read FLeftFingerImg         write SetLeftFingerImg;
    property rightFingerImg     : string          read FRightFingerImg        write SetRightFingerImg;
    property leftFingerSpec     : string          read FLeftFingerSpec        write SetLeftFingerSpec;
    property rightFingerSpec    : string          read FRightFingerSpec       write SetRightFingerSpec;
    property leftQuality        : Integer         read FLeftQuality           write SetLeftQuality;
    property rightQuality       : Integer         read FRightQuality          write SetRightQuality;
    property createId           : string          read FCreateId              write SetCreateId;
    property createDtm          : TDateTime       read FCreateDtm             write SetCreateDtm;
    property procId             : string          read FProcId                write SetProcId;
    property procDtm            : TDateTime       read FProcDtm               write SetProcDtm;
    property flagType           : string          read FFlagType              write SetFlagType;
    property resFlag            : string          read FResFlag               write SetResFlag;
    property resMsg             : string          read FResMsg                write SetResMsg;
end;


implementation

{ TFNIObj }

constructor TFNIObj.Create;
begin
  inherited;

end;

destructor TFNIObj.Destroy;
begin

  inherited;
end;

procedure TFNIObj.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure TFNIObj.SetCreateDtm(const Value: TDateTime);
begin
  FCreateDtm := Value;
end;

procedure TFNIObj.SetCreateId(const Value: string);
begin
  FCreateId := Value;
end;

procedure TFNIObj.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure TFNIObj.SetLeftFingerImg(const Value: string);
begin
  FLeftFingerImg := Value;
end;

procedure TFNIObj.SetLeftFingerIndex(const Value: string);
begin
  FLeftFingerIndex := Value;
end;

procedure TFNIObj.SetLeftFingerSpec(const Value: string);
begin
  FLeftFingerSpec := Value;
end;

procedure TFNIObj.SetLeftQuality(const Value: Integer);
begin
  FLeftQuality := Value;
end;

procedure TFNIObj.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure TFNIObj.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

procedure TFNIObj.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TFNIObj.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TFNIObj.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure TFNIObj.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;

procedure TFNIObj.SetRightFingerImg(const Value: string);
begin
  FRightFingerImg := Value;
end;

procedure TFNIObj.SetRightFingerIndex(const Value: string);
begin
  FRightFingerIndex := Value;
end;

procedure TFNIObj.SetRightFingerSpec(const Value: string);
begin
  FRightFingerSpec := Value;
end;

procedure TFNIObj.SetRightQuality(const Value: Integer);
begin
  FRightQuality := Value;
end;

end.

