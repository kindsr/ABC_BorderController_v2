{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit S510;

interface

type
  TS510 = class(TObject)
  private
    FEdGb                   : string; { 출입국구분 }
    FEdDate                 : string; { 출입일자 }
    FEdTime                 : string; { 출입시간 }
    FKioskIp                : string; { 심사대IP }
    FRegNo                  : string; { 등록번호 }
    FKioskStartDtm          : string; { 심사대시작일시 }
    FKioskEndDtm            : string; { 심사대종료일시 }
    FRegulYn                : string; { 규제여부 }
    FRegulDesc              : string; { 규제사유 }
    FNotiYn                 : string; { 통보여부 }
    FProcStat               : string; { 처리상태 }
    FServiceStat            : string; { 서비스상태 }
    FEpassYn                : string; { 전자여권여부 }
    FEpassErrCd             : string; { 전자여권에러코드 }
    FRepSojQualCd           : string; { 대분류체류자격코드 }
    FSubSojQualCd           : string; { 소분류체류자격코드 }
    FSojQualYn              : string; { 체류자격여부 }
    FMajorChangeGb          : string; { 주요변경구분 }
    FMngYn                  : string; { 관리대상여부 }
    FMngDesc                : string; { 관리대상사유 }
    FOffiCd                 : string; { 사무소코드 }
    FRegYn                  : string; { 등록여부 }
    ///////////////////////////////////////////////////////////
    ///  for S520, S530, S540, S550, S560, S570, S580, S590 ///
    ///////////////////////////////////////////////////////////
    FPassImg                : string;
    FFailCnt                : Integer;
    FDoorDirection          : string;
    FFingerMatchYn          : string;
    FFingerSpec             : string;
    FFingerMatchRate        : Single;
    FFingerMatchRateLeft    : Single;
    FFingerMatchRateRight   : Single;
    FFaceMatchYn            : string;
    FFaceImg                : string;
    FFaceMatchRate          : Single;
    FCamGb                  : string;
    ///////////////////////////////////////////////////////////
    FProcId                 : string; { 처리자ID }
    FProcDtm                : TDateTime; { 처리일시 }
    FFlagType               : string;
    procedure SetEdGb(const Value: string);
    procedure SetEdDate(const Value: string);
    procedure SetEdTime(const Value: string);
    procedure SetKioskIp(const Value: string);
    procedure SetRegNo(const Value: string);
    procedure SetKioskStartDtm(const Value: string);
    procedure SetKioskEndDtm(const Value: string);
    procedure SetRegulYn(const Value: string);
    procedure SetRegulDesc(const Value: string);
    procedure SetNotiYn(const Value: string);
    procedure SetProcStat(const Value: string);
    procedure SetServiceStat(const Value: string);
    procedure SetEpassYn(const Value: string);
    procedure SetEpassErrCd(const Value: string);
    procedure SetRepSojQualCd(const Value: string);
    procedure SetSubSojQualCd(const Value: string);
    procedure SetSojQualYn(const Value: string);
    procedure SetMajorChangeGb(const Value: string);
    procedure SetMngYn(const Value: string);
    procedure SetMngDesc(const Value: string);
    procedure SetOffiCd(const Value: string);
    procedure SetRegYn(const Value: string);
    procedure SetProcId(const Value: string);
    procedure SetProcDtm(const Value: TDateTime);
    procedure SetFlagType(const Value: string);
    ///////////////////////////////////////////////////////////
    ///  for S520, S530, S540, S550, S560, S570, S580, S590 ///
    ///////////////////////////////////////////////////////////
    procedure SetPassImg(const Value: string);
    procedure SetFailCnt(const Value: Integer);
    procedure SetDoorDirection(const Value: string);
    procedure SetFingerMatchYn(const Value: string);
    procedure SetFingerSpec(const Value:string);
    procedure SetFingerMatchRate(const Value: Single);
    procedure SetFingerMatchRateLeft(const Value: Single);
    procedure SetFingerMatchRateRight(const Value: Single);
    procedure SetFaceMatchYn(const Value:string);
    procedure SetFaceImg(const Value:string);
    procedure SetFaceMatchRate(const Value: Single);
    procedure SetCamGb(const Value:string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property edGb                 : string           read FEdGb                    write SetEdGb;
    property edDate               : string           read FEdDate                  write SetEdDate;
    property edTime               : string           read FEdTime                  write SetEdTime;
    property kioskIp              : string           read FKioskIp                 write SetKioskIp;
    property regNo                : string           read FRegNo                   write SetRegNo;
    property kioskStartDtm        : string           read FKioskStartDtm           write SetKioskStartDtm;
    property kioskEndDtm          : string           read FKioskEndDtm             write SetKioskEndDtm;
    property regulYn              : string           read FRegulYn                 write SetRegulYn;
    property regulDesc            : string           read FRegulDesc               write SetRegulDesc;
    property notiYn               : string           read FNotiYn                  write SetNotiYn;
    property procStat             : string           read FProcStat                write SetProcStat;
    property serviceStat          : string           read FServiceStat             write SetServiceStat;
    property epassYn              : string           read FEpassYn                 write SetEpassYn;
    property epassErrCd           : string           read FEpassErrCd              write SetEpassErrCd;
    property repSojQualCd         : string           read FRepSojQualCd            write SetRepSojQualCd;
    property subSojQualCd         : string           read FSubSojQualCd            write SetSubSojQualCd;
    property sojQualYn            : string           read FSojQualYn               write SetSojQualYn;
    property majorChangeGb        : string           read FMajorChangeGb           write SetMajorChangeGb;
    property mngYn                : string           read FMngYn                   write SetMngYn;
    property mngDesc              : string           read FMngDesc                 write SetMngDesc;
    property offiCd               : string           read FOffiCd                  write SetOffiCd;
    property regYn                : string           read FRegYn                   write SetRegYn;
    property procId               : string           read FProcId                  write SetProcId;
    property procDtm              : TDateTime        read FProcDtm                 write SetProcDtm;
    property flagType             : string           read FFlagType                write SetFlagType;
    ///////////////////////////////////////////////////////////
    ///  for S520, S530, S540, S550, S560, S570, S580, S590 ///
    ///////////////////////////////////////////////////////////
    property passImg              : string           read FPassImg                 write SetPassImg;
    property failCnt              : Integer          read FFailCnt                 write SetFailCnt;
    property doorDirection        : string           read FDoorDirection           write SetDoorDirection;
    property fingerMatchYn        : string           read FFingerMatchYn           write SetFingerMatchYn;
    property fingerSpec           : string           read FFingerSpec              write SetFingerSpec;
    property fingerMatchRate      : Single           read FFingerMatchRate         write SetFingerMatchRate;
    property fingerMatchRateLeft  : Single           read FFingerMatchRateLeft     write SetFingerMatchRateLeft;
    property fingerMatchRateRight : Single           read FFingerMatchRateRight    write SetFingerMatchRateRight;
    property faceMatchYn          : string           read FFaceMatchYn             write SetFaceMatchYn;
    property faceImg              : string           read FFaceImg                 write SetFaceImg;
    property faceMatchRate        : Single           read FFaceMatchRate           write SetFaceMatchRate;
    property camGb                : string           read FCamGb                   write SetCamGb;
  end;

implementation


{ TS510 }

constructor TS510.Create;
begin
  inherited;
end;

destructor TS510.Destroy;
begin

  inherited;
end;

procedure TS510.SetEdGb(const Value: string);
begin
  FEdGb := Value;
end;

procedure TS510.SetEdDate(const Value: string);
begin
  FEdDate := Value;
end;

procedure TS510.SetEdTime(const Value: string);
begin
  FEdTime := Value;
end;

procedure TS510.SetKioskIp(const Value: string);
begin
  FKioskIp := Value;
end;

procedure TS510.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TS510.SetKioskStartDtm(const Value: string);
begin
  FKioskStartDtm := Value;
end;

procedure TS510.SetKioskEndDtm(const Value: string);
begin
  FKioskEndDtm := Value;
end;

procedure TS510.SetRegulYn(const Value: string);
begin
  FRegulYn := Value;
end;

procedure TS510.SetRegulDesc(const Value: string);
begin
  FRegulDesc := Value;
end;

procedure TS510.SetNotiYn(const Value: string);
begin
  FNotiYn := Value;
end;

procedure TS510.SetProcStat(const Value: string);
begin
  FProcStat := Value;
end;

procedure TS510.SetServiceStat(const Value: string);
begin
  FServiceStat := Value;
end;

procedure TS510.SetEpassYn(const Value: string);
begin
  FEpassYn := Value;
end;

procedure TS510.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure TS510.SetEpassErrCd(const Value: string);
begin
  FEpassErrCd := Value;
end;

procedure TS510.SetRepSojQualCd(const Value: string);
begin
  FRepSojQualCd := Value;
end;

procedure TS510.SetSubSojQualCd(const Value: string);
begin
  FSubSojQualCd := Value;
end;

procedure TS510.SetSojQualYn(const Value: string);
begin
  FSojQualYn := Value;
end;

procedure TS510.SetMajorChangeGb(const Value: string);
begin
  FMajorChangeGb := Value;
end;

procedure TS510.SetMngYn(const Value: string);
begin
  FMngYn := Value;
end;

procedure TS510.SetMngDesc(const Value: string);
begin
  FMngDesc := Value;
end;

procedure TS510.SetOffiCd(const Value: string);
begin
  FOffiCd := Value;
end;

procedure TS510.SetRegYn(const Value: string);
begin
  FRegYn := Value;
end;

procedure TS510.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TS510.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

///////////////////////////////////////////////////////////
///  for S520, S530, S540, S550, S560, S570, S580, S590 ///
///////////////////////////////////////////////////////////
procedure TS510.SetPassImg(const Value: string);
begin
  FPassImg := Value;
end;

procedure TS510.SetFailCnt(const Value: Integer);
begin
  FFailCnt := Value;
end;

procedure TS510.SetDoorDirection(const Value: string);
begin
  FDoorDirection := Value;
end;

procedure TS510.SetFingerMatchYn(const Value: string);
begin
  FFingerMatchYn := Value;
end;

procedure TS510.SetFingerSpec(const Value:string);
begin
  FFingerSpec := Value;
end;

procedure TS510.SetFingerMatchRate(const Value: Single);
begin
  FFingerMatchRate := Value;
end;

procedure TS510.SetFingerMatchRateLeft(const Value: Single);
begin
  FFingerMatchRateLeft := Value;
end;

procedure TS510.SetFingerMatchRateRight(const Value: Single);
begin
  FFingerMatchRateRight := Value;
end;

procedure TS510.SetFaceMatchYn(const Value:string);
begin
  FFaceMatchYn := Value;
end;

procedure TS510.SetFaceImg(const Value:string);
begin
  FFaceImg := Value;
end;

procedure TS510.SetFaceMatchRate(const Value: Single);
begin
  FFaceMatchRate := Value;
end;

procedure TS510.SetCamGb(const Value:string);
begin
  FCamGb := Value;
end;


end.
