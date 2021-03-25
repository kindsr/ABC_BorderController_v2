{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit PassportInfo;

interface

uses Classes;

{Class for Objects}

type
  TPPIObj = class(TObject)
  private
    FRegNo                  : string;
    FName                   : string;
    FBirth                  : string;
    FSex                    : string;
    FNatCd                  : string;
    FModiNatCd              : string;
    FJuminNo                : string;
    FFgnGb                  : string;
    FPassNo                 : string;
    FPassGb                 : string;
    FPassIssDate            : string;
    FPassExpDate            : string;
    FElecPassYn             : string;
    FRegDate                : string;
    FChangeDate             : string;
    FTelNo                  : string;
    FMobileNo               : string;
    FEmail                  : string;
    FAddr_1                 : string;
    FAddr_2                 : string;
    FSignImg                : string;
    FMrpPhotoImg            : string;
    FPaxGb                  : string;
    FCrewNo                 : string;
    FTestPassYn             : string;
    FCreateId               : string;
    FCreateDtm              : TDateTime;
    FProcId                 : string;
    FProcDtm                : TDateTime;
    FFlagType               : string;
    FResFlag                : string;
    FResMsg                 : string;
    procedure SetRegNo(const Value: string);
    procedure SetName(const Value: string);
    procedure SetBirth(const Value: string);
    procedure SetSex(const Value: string);
    procedure SetNatCd(const Value: string);
    procedure SetModiNatCd(const Value: string);
    procedure SetJuminNo(const Value: string);
    procedure SetFgnGb(const Value: string);
    procedure SetPassNo(const Value: string);
    procedure SetPassGb(const Value: string);
    procedure SetPassIssDate(const Value: string);
    procedure SetPassExpDate(const Value: string);
    procedure SetElecPassYn(const Value: string);
    procedure SetRegDate(const Value: string);
    procedure SetChangeDate(const Value: string);
    procedure SetTelNo(const Value: string);
    procedure SetMobileNo(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetAddr_1(const Value: string);
    procedure SetAddr_2(const Value: string);
    procedure SetSignImg(const Value: string);
    procedure SetMrpPhotoImg(const Value: string);
    procedure SetPaxGb(const Value: string);
    procedure SetCrewNo(const Value: string);
    procedure SetTestPassYn(const Value: string);
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
    property name          : string          read FName           write SetName;
    property birth         : string          read FBirth          write SetBirth;
    property sex           : string          read FSex            write SetSex;
    property natCd         : string          read FNatCd          write SetNatCd;
    property modiNatCd     : string          read FModiNatCd      write SetModiNatCd;
    property juminNo       : string          read FJuminNo        write SetJuminNo;
    property fgnGb         : string          read FFgnGb          write SetFgnGb;
    property passNo        : string          read FPassNo         write SetPassNo;
    property passGb        : string          read FPassGb         write SetPassGb;
    property passIssDate   : string          read FPassIssDate    write SetPassIssDate;
    property passExpDate   : string          read FPassExpDate    write SetPassExpDate;
    property elecPassYn    : string          read FElecPassYn     write SetElecPassYn;
    property regDate       : string          read FRegDate        write SetRegDate;
    property changeDate    : string          read FChangeDate     write SetChangeDate;
    property telNo         : string          read FTelNo          write SetTelNo;
    property mobileNo      : string          read FMobileNo       write SetMobileNo;
    property email         : string          read FEmail          write SetEmail;
    property addr_1        : string          read FAddr_1         write SetAddr_1;
    property addr_2        : string          read FAddr_2         write SetAddr_2;
    property signImg       : string          read FSignImg        write SetSignImg;
    property mrpPhotoImg   : string          read FMrpPhotoImg    write SetMrpPhotoImg;
    property paxGb         : string          read FPaxGb          write SetPaxGb;
    property crewNo        : string          read FCrewNo         write SetCrewNo;
    property testPassYn    : string          read FTestPassYn     write SetTestPassYn;
    property createId      : string          read FCreateId       write SetCreateId;
    property createDtm     : TDateTime       read FCreateDtm      write SetCreateDtm;
    property procId        : string          read FProcId         write SetProcId;
    property procDtm       : TDateTime       read FProcDtm        write SetProcDtm;
    property flagType      : string          read FFlagType       write SetFlagType;
    property resFlag       : string          read FResFlag        write SetResFlag;
    property resMsg        : string          read FResMsg         write SetResMsg;
end;


implementation

{ TPPIObj }

constructor TPPIObj.Create;
begin
  inherited;
end;

destructor TPPIObj.Destroy;
begin
  inherited;
end;

procedure TPPIObj.SetAddr_1(const Value: string);
begin
  FAddr_1 := Value;
end;

procedure TPPIObj.SetAddr_2(const Value: string);
begin
  FAddr_2 := Value;
end;

procedure TPPIObj.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure TPPIObj.SetChangeDate(const Value: string);
begin
  FChangeDate := Value;
end;

procedure TPPIObj.SetCreateDtm(const Value: TDateTime);
begin
  FCreateDtm := Value;
end;

procedure TPPIObj.SetCreateId(const Value: string);
begin
  FCreateId := Value;
end;

procedure TPPIObj.SetCrewNo(const Value: string);
begin
  FCrewNo := Value;
end;

procedure TPPIObj.SetElecPassYn(const Value: string);
begin
  FElecPassYn := Value;
end;

procedure TPPIObj.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TPPIObj.SetFgnGb(const Value: string);
begin
  FFgnGb := Value;
end;

procedure TPPIObj.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure TPPIObj.SetJuminNo(const Value: string);
begin
  FJuminNo := Value;
end;

procedure TPPIObj.SetMobileNo(const Value: string);
begin
  FMobileNo := Value;
end;

procedure TPPIObj.SetModiNatCd(const Value: string);
begin
  FModiNatCd := Value;
end;

procedure TPPIObj.SetMrpPhotoImg(const Value: string);
begin
  FMrpPhotoImg := Value;
end;

procedure TPPIObj.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TPPIObj.SetNatCd(const Value: string);
begin
  FNatCd := Value;
end;

procedure TPPIObj.SetPaxGb(const Value: string);
begin
  FPaxGb := Value;
end;

procedure TPPIObj.SetPassExpDate(const Value: string);
begin
  FPassExpDate := Value;
end;

procedure TPPIObj.SetPassGb(const Value: string);
begin
  FPassGb := Value;
end;

procedure TPPIObj.SetPassIssDate(const Value: string);
begin
  FPassIssDate := Value;
end;

procedure TPPIObj.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure TPPIObj.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

procedure TPPIObj.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TPPIObj.SetRegDate(const Value: string);
begin
  FRegDate := Value;
end;

procedure TPPIObj.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TPPIObj.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure TPPIObj.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;

procedure TPPIObj.SetSex(const Value: string);
begin
  FSex := Value;
end;

procedure TPPIObj.SetSignImg(const Value: string);
begin
  FSignImg := Value;
end;

procedure TPPIObj.SetTelNo(const Value: string);
begin
  FTelNo := Value;
end;

procedure TPPIObj.SetTestPassYn(const Value: string);
begin
  FTestPassYn := Value;
end;

end.
