{*******************************************************}
{                                                       }
{                BorderController                       }
{                                                       }
{           Copyright (C) 2018 G-An Tech.               }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}
unit CrewInfo;

interface

uses Classes;

{Class for Objects}

type
  TCRWObj = class(TObject)
  private
    FRegNo                  : string; {등록번호}
    FCrewNo                 : string; { 승무원번호 }
    FName                   : string; { 이름 }
    FNameSeq                : Integer; { 동일인구분번호 }
    FBirth                  : string; { 생년월일 }
    FSex                    : string; { 성별 }
    FNatCd                  : string; { 국가코드 }
    FEngName                : string; { 영문이름 }
    FFgnRegNo               : string; { 외국인등록번호 }
    FJuminNo                : string; { 주민등록번호 }
    FAirlineCd              : string; { 항공사코드 }
    FCrewGb                 : string; { 승무원구분 }
    FCrewRegNo              : string; { 승무원등록번호 }
    FPassNo                 : string; { 여권번호 }
    FPassGb                 : string; { 여권구분 }
    FPassIssDate            : string; { 여권이슈일자 }
    FPassExpDate            : string; { 여권만기일자 }
    FElecPassYn             : string; { 전자여권여부 }
    FRegDate                : string; { 등록일자 }
    FReleaseDate            : string; { 해제일자 }
    FProcGb                 : string; { 처리구분 }
    FRemark                 : string; { 비고 }
    FIssUserId              : string; { 발급자ID }
    FReleaseUserId          : string; { 반납자ID }
    FPosGb                  : string; { 직위구분 }
    FSojQualYn              : string; { 체류자격여부 }
    FSojQualCd              : string; { 체류자격코드 }
    FSojExprDate            : string; { 체류만료일자 }
    FCrewImg                : string; { 승무원이미지 }
    FMrpPhotoImg            : string; { 여권판독기사진이미지 }
    FTestPassYn             : string; { 테스트여권여부 }
    FCreateId               : string; { 생성자ID }
    FCreateDtm              : TDateTime; { 생성일시 }
    FProcId                 : string; { 처리자ID }
    FProcDtm                : TDateTime; { 처리일시 }
    FFlagType               : string;
    FResFlag                : string;
    FResMsg                 : string;

    procedure SetRegNo(const Value: string);
    procedure SetCrewNo(const Value: string);
    procedure SetName(const Value: string);
    procedure SetNameSeq(const Value: Integer);
    procedure SetBirth(const Value: string);
    procedure SetSex(const Value: string);
    procedure SetNatCd(const Value: string);
    procedure SetEngName(const Value: string);
    procedure SetFgnRegNo(const Value: string);
    procedure SetJuminNo(const Value: string);
    procedure SetAirlineCd(const Value: string);
    procedure SetCrewGb(const Value: string);
    procedure SetCrewRegNo(const Value: string);
    procedure SetPassNo(const Value: string);
    procedure SetPassGb(const Value: string);
    procedure SetPassIssDate(const Value: string);
    procedure SetPassExpDate(const Value: string);
    procedure SetElecPassYn(const Value: string);
    procedure SetRegDate(const Value: string);
    procedure SetReleaseDate(const Value: string);
    procedure SetProcGb(const Value: string);
    procedure SetRemark(const Value: string);
    procedure SetIssUserId(const Value: string);
    procedure SetReleaseUserId(const Value: string);
    procedure SetPosGb(const Value: string);
    procedure SetSojQualYn(const Value: string);
    procedure SetSojQualCd(const Value: string);
    procedure SetSojExprDate(const Value: string);
    procedure SetCrewImg(const Value: string);
    procedure SetMrpPhotoImg(const Value: string);
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
    property regNo                : string           read FRegNo                   write SetRegNo;
    property crewNo               : string           read FCrewNo                  write SetCrewNo;
    property name                 : string           read FName                    write SetName;
    property nameSeq              : Integer          read FNameSeq                 write SetNameSeq;
    property birth                : string           read FBirth                   write SetBirth;
    property sex                  : string           read FSex                     write SetSex;
    property natCd                : string           read FNatCd                   write SetNatCd;
    property engName              : string           read FEngName                 write SetEngName;
    property fgnRegNo             : string           read FFgnRegNo                write SetFgnRegNo;
    property juminNo              : string           read FJuminNo                 write SetJuminNo;
    property airlineCd            : string           read FAirlineCd               write SetAirlineCd;
    property crewGb               : string           read FCrewGb                  write SetCrewGb;
    property crewRegNo            : string           read FCrewRegNo               write SetCrewRegNo;
    property passNo               : string           read FPassNo                  write SetPassNo;
    property passGb               : string           read FPassGb                  write SetPassGb;
    property passIssDate          : string           read FPassIssDate             write SetPassIssDate;
    property passExpDate          : string           read FPassExpDate             write SetPassExpDate;
    property elecPassYn           : string           read FElecPassYn              write SetElecPassYn;
    property regDate              : string           read FRegDate                 write SetRegDate;
    property releaseDate          : string           read FReleaseDate             write SetReleaseDate;
    property procGb               : string           read FProcGb                  write SetProcGb;
    property remark               : string           read FRemark                  write SetRemark;
    property issUserId            : string           read FIssUserId               write SetIssUserId;
    property releaseUserId        : string           read FReleaseUserId           write SetReleaseUserId;
    property posGb                : string           read FPosGb                   write SetPosGb;
    property sojQualYn            : string           read FSojQualYn               write SetSojQualYn;
    property sojQualCd            : string           read FSojQualCd               write SetSojQualCd;
    property sojExprDate          : string           read FSojExprDate             write SetSojExprDate;
    property crewImg              : string           read FCrewImg                 write SetCrewImg;
    property mrpPhotoImg          : string           read FMrpPhotoImg             write SetMrpPhotoImg;
    property testPassYn           : string           read FTestPassYn              write SetTestPassYn;
    property createId             : string           read FCreateId                write SetCreateId;
    property createDtm            : TDateTime        read FCreateDtm               write SetCreateDtm;
    property procId               : string           read FProcId                  write SetProcId;
    property procDtm              : TDateTime        read FProcDtm                 write SetProcDtm;
    property flagType             : string           read FFlagType                write SetFlagType;
    property resFlag              : string           read FResFlag                 write SetResFlag;
    property resMsg               : string           read FResMsg                  write SetResMsg;
  end;

implementation

{ TCRWObj }

constructor TCRWObj.Create;
begin
  inherited;
end;

destructor TCRWObj.Destroy;
begin
  inherited;
end;

procedure TCRWObj.SetCrewNo(const Value: string);
begin
  FCrewNo := Value;
end;

procedure TCRWObj.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TCRWObj.SetNameSeq(const Value: Integer);
begin
  FNameSeq := Value;
end;

procedure TCRWObj.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure TCRWObj.SetSex(const Value: string);
begin
  FSex := Value;
end;

procedure TCRWObj.SetNatCd(const Value: string);
begin
  FNatCd := Value;
end;

procedure TCRWObj.SetEngName(const Value: string);
begin
  FEngName := Value;
end;

procedure TCRWObj.SetFgnRegNo(const Value: string);
begin
  FFgnRegNo := Value;
end;

procedure TCRWObj.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure TCRWObj.SetJuminNo(const Value: string);
begin
  FJuminNo := Value;
end;

procedure TCRWObj.SetAirlineCd(const Value: string);
begin
  FAirlineCd := Value;
end;

procedure TCRWObj.SetCrewGb(const Value: string);
begin
  FCrewGb := Value;
end;

procedure TCRWObj.SetCrewRegNo(const Value: string);
begin
  FCrewRegNo := Value;
end;

procedure TCRWObj.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure TCRWObj.SetPassGb(const Value: string);
begin
  FPassGb := Value;
end;

procedure TCRWObj.SetPassIssDate(const Value: string);
begin
  FPassIssDate := Value;
end;

procedure TCRWObj.SetPassExpDate(const Value: string);
begin
  FPassExpDate := Value;
end;

procedure TCRWObj.SetElecPassYn(const Value: string);
begin
  FElecPassYn := Value;
end;

procedure TCRWObj.SetRegDate(const Value: string);
begin
  FRegDate := Value;
end;

procedure TCRWObj.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TCRWObj.SetReleaseDate(const Value: string);
begin
  FReleaseDate := Value;
end;

procedure TCRWObj.SetProcGb(const Value: string);
begin
  FProcGb := Value;
end;

procedure TCRWObj.SetRemark(const Value: string);
begin
  FRemark := Value;
end;

procedure TCRWObj.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure TCRWObj.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;

procedure TCRWObj.SetIssUserId(const Value: string);
begin
  FIssUserId := Value;
end;

procedure TCRWObj.SetReleaseUserId(const Value: string);
begin
  FReleaseUserId := Value;
end;

procedure TCRWObj.SetPosGb(const Value: string);
begin
  FPosGb := Value;
end;

procedure TCRWObj.SetSojQualYn(const Value: string);
begin
  FSojQualYn := Value;
end;

procedure TCRWObj.SetSojQualCd(const Value: string);
begin
  FSojQualCd := Value;
end;

procedure TCRWObj.SetSojExprDate(const Value: string);
begin
  FSojExprDate := Value;
end;

procedure TCRWObj.SetCrewImg(const Value: string);
begin
  FCrewImg := Value;
end;

procedure TCRWObj.SetMrpPhotoImg(const Value: string);
begin
  FMrpPhotoImg := Value;
end;

procedure TCRWObj.SetTestPassYn(const Value: string);
begin
  FTestPassYn := Value;
end;

procedure TCRWObj.SetCreateId(const Value: string);
begin
  FCreateId := Value;
end;

procedure TCRWObj.SetCreateDtm(const Value: TDateTime);
begin
  FCreateDtm := Value;
end;

procedure TCRWObj.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TCRWObj.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

end.
