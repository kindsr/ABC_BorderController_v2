{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit FaceInfo;

interface

uses Classes;

{Class for Objects}

type
  TFCIObj = class(TObject)
  private
    FRegNo                  : string;
    FPassNo                 : string;
    FBirth                  : string;
    FFaceImg                : string;
    FFaceSpec               : string;
    FQuality                : Integer;
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
    procedure SetFaceImg(const Value: string);
    procedure SetFaceSpec(const Value: string);
    procedure SetQuality(const Value: Integer);
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
    property regNo         : string          read FRegNo          write SetRegNo;
    property passNo        : string          read FPassNo         write SetPassNo;
    property birth         : string          read FBirth          write SetBirth;
    property faceImg       : string          read FFaceImg        write SetFaceImg;
    property faceSpec      : string          read FFaceSpec       write SetFaceSpec;
    property quality       : Integer         read FQuality        write SetQuality;
    property createId      : string          read FCreateId       write SetCreateId;
    property createDtm     : TDateTime       read FCreateDtm      write SetCreateDtm;
    property procId        : string          read FProcId         write SetProcId;
    property procDtm       : TDateTime       read FProcDtm        write SetProcDtm;
    property flagType      : string          read FFlagType       write SetFlagType;
    property resFlag       : string          read FResFlag        write SetResFlag;
    property resMsg        : string          read FResMsg         write SetResMsg;
end;


implementation

{ TFCIObj }

constructor TFCIObj.Create;
begin
  inherited;

end;

destructor TFCIObj.Destroy;
begin

  inherited;
end;

procedure TFCIObj.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure TFCIObj.SetCreateDtm(const Value: TDateTime);
begin
  FCreateDtm := Value;
end;

procedure TFCIObj.SetCreateId(const Value: string);
begin
  FCreateId := Value;
end;

procedure TFCIObj.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure TFCIObj.SetFaceImg(const Value: string);
begin
  FFaceImg := Value;
end;

procedure TFCIObj.SetQuality(const Value: Integer);
begin
  FQuality := Value;
end;

procedure TFCIObj.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure TFCIObj.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

procedure TFCIObj.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TFCIObj.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TFCIObj.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure TFCIObj.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;

procedure TFCIObj.SetFaceSpec(const Value: string);
begin
  FFaceSpec := Value;
end;


end.

