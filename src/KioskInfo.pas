{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit KioskInfo;

interface

type
  // Table for S100, S300
  TKioskInfo = class(TObject)
  private
    FEdGb                   : string; { 출입국구분 }
    FKioskIp                : string; { 심사대IP }
    FKioskPort              : string; { 심사대PORT }
    FSvrIp                  : string; { 접속서버IP }
    FSvrPort                : string; { 접속서버PORT }
    FRejudgIp               : string; { 재심실IP }
    FRejudgPort             : string; { 재심실PORT }
    FRejudgScrSeq           : string; { 재심실화면순번 }
    FKioskConnStat          : string; { 심사대연결상태 }
    FSvrConnStat            : string; { 접속서버연결상태 }
    FRejudgConnStat         : string; { 재심실연결상태 }
    FWorkDate               : string; { 작업일자 }
    FWorkTime               : string; { 작업시간 }
    FOpYn                   : string; { 운영여부 }
    FOffiCd                 : string; { 사무소코드 }
    FSectorGb               : string; { 심사구역구분 }
    FAirPortGb              : string; { 공항항만구분 }
    FFlightnoChkYn          : string; { 편명체크여부 }
    FPrtYn                  : string; { 프린터여부 }
    FKioskType              : string; { 심사대타입 }
    FKioskEmJudgeYn         : string; { 심사대비상심사여부 }
    FCreateId               : string; { 생성자ID }
    FCreateDtm              : TDateTime; { 생성일시 }
    FProcId                 : string; { 처리자ID }
    FProcDtm                : TDateTime; { 처리일시 }
    procedure SetEdGb(const Value: string);
    procedure SetKioskIp(const Value: string);
    procedure SetKioskPort(const Value: string);
    procedure SetSvrIp(const Value: string);
    procedure SetSvrPort(const Value: string);
    procedure SetRejudgIp(const Value: string);
    procedure SetRejudgPort(const Value: string);
    procedure SetRejudgScrSeq(const Value: string);
    procedure SetKioskConnStat(const Value: string);
    procedure SetSvrConnStat(const Value: string);
    procedure SetRejudgConnStat(const Value: string);
    procedure SetFWorkDate(const Value: string);
    procedure SetFWorkTime(const Value: string);
    procedure SetFOpYn(const Value: string);
    procedure SetFOffiCd(const Value: string);
    procedure SetSectorGb(const Value: string);
    procedure SetAirPortGb(const Value: string);
    procedure SetFlightnoChkYn(const Value: string);
    procedure SetPrtYn(const Value: string);
    procedure SetKioskType(const Value: string);
    procedure SetKioskEmJudgeYn(const Value: string);
    procedure SetCreateId(const Value: string);
    procedure SetCreateDtm(const Value: TDateTime);
    procedure SetProcId(const Value: string);
    procedure SetProcDtm(const Value: TDateTime);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property edGb                 : string           read FEdGb                    write SetEdGb;
    property kioskIp              : string           read FKioskIp                 write SetKioskIp;
    property kioskPort            : string           read FKioskPort               write SetKioskPort;
    property svrIp                : string           read FSvrIp                   write SetSvrIp;
    property svrPort              : string           read FSvrPort                 write SetSvrPort;
    property rejudgIp             : string           read FRejudgIp                write SetRejudgIp;
    property rejudgPort           : string           read FRejudgPort              write SetRejudgPort;
    property rejudgScrSeq         : string           read FRejudgScrSeq            write SetRejudgScrSeq;
    property kioskConnStat        : string           read FKioskConnStat           write SetKioskConnStat;
    property svrConnStat          : string           read FSvrConnStat             write SetSvrConnStat;
    property rejudgConnStat       : string           read FRejudgConnStat          write SetRejudgConnStat;
    property workDate             : string           read FWorkDate                write SetFWorkDate;
    property workTime             : string           read FWorkTime                write SetFWorkTime;
    property opYn                 : string           read FOpYn                    write SetFOpYn;
    property offiCd               : string           read FOffiCd                  write SetFOffiCd;
    property sectorGb             : string           read FSectorGb                write SetSectorGb;
    property airPortGb            : string           read FAirPortGb               write SetAirPortGb;
    property flightnoChkYn        : string           read FFlightnoChkYn           write SetFlightnoChkYn;
    property prtYn                : string           read FPrtYn                   write SetPrtYn;
    property kioskType            : string           read FKioskType               write SetKioskType;
    property kioskEmJudgeYn       : string           read FKioskEmJudgeYn          write SetKioskEmJudgeYn;
    property createId             : string           read FCreateId                write SetCreateId;
    property createDtm            : TDateTime        read FCreateDtm               write SetCreateDtm;
    property procId               : string           read FProcId                  write SetProcId;
    property procDtm              : TDateTime        read FProcDtm                 write SetProcDtm;
  end;

implementation


{ TKioskInfo }

constructor TKioskInfo.Create;
begin
  inherited;
end;

destructor TKioskInfo.Destroy;
begin
  inherited;
end;

procedure TKioskInfo.SetEdGb(const Value: string);
begin
  FEdGb := Value;
end;

procedure TKioskInfo.SetKioskIp(const Value: string);
begin
  FKioskIp := Value;
end;

procedure TKioskInfo.SetKioskPort(const Value: string);
begin
  FKioskPort := Value;
end;

procedure TKioskInfo.SetSvrIp(const Value: string);
begin
  FSvrIp := Value;
end;

procedure TKioskInfo.SetSvrPort(const Value: string);
begin
  FSvrPort := Value;
end;

procedure TKioskInfo.SetRejudgIp(const Value: string);
begin
  FRejudgIp := Value;
end;

procedure TKioskInfo.SetRejudgPort(const Value: string);
begin
  FRejudgPort := Value;
end;

procedure TKioskInfo.SetRejudgScrSeq(const Value: string);
begin
  FRejudgScrSeq := Value;
end;

procedure TKioskInfo.SetKioskConnStat(const Value: string);
begin
  FKioskConnStat := Value;
end;

procedure TKioskInfo.SetSvrConnStat(const Value: string);
begin
  FSvrConnStat := Value;
end;

procedure TKioskInfo.SetRejudgConnStat(const Value: string);
begin
  FRejudgConnStat := Value;
end;

procedure TKioskInfo.SetSectorGb(const Value: string);
begin
  FSectorGb := Value;
end;

procedure TKioskInfo.SetAirPortGb(const Value: string);
begin
  FAirPortGb := Value;
end;

procedure TKioskInfo.SetFlightnoChkYn(const Value: string);
begin
  FFlightnoChkYn := Value;
end;

procedure TKioskInfo.SetFOffiCd(const Value: string);
begin
  FOffiCd := Value;
end;

procedure TKioskInfo.SetFOpYn(const Value: string);
begin
  FOpYn := Value;
end;

procedure TKioskInfo.SetFWorkDate(const Value: string);
begin
  FWorkDate := Value;
end;

procedure TKioskInfo.SetFWorkTime(const Value: string);
begin
  FWorkTime := Value;
end;

procedure TKioskInfo.SetPrtYn(const Value: string);
begin
  FPrtYn := Value;
end;

procedure TKioskInfo.SetKioskType(const Value: string);
begin
  FKioskType := Value;
end;

procedure TKioskInfo.SetKioskEmJudgeYn(const Value: string);
begin
  FKioskEmJudgeYn := Value;
end;

procedure TKioskInfo.SetCreateId(const Value: string);
begin
  FCreateId := Value;
end;

procedure TKioskInfo.SetCreateDtm(const Value: TDateTime);
begin
  FCreateDtm := Value;
end;

procedure TKioskInfo.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure TKioskInfo.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;


end.
