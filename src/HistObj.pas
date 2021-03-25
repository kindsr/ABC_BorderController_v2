{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit HistObj;

interface

type
  THistObj = class(TObject)
  private
    FTableName              : string; { ���̺�� }
    FEdGb                   : string; { ���Ա����� }
    FEdDate                 : string; { �������� }
    FEdTime                 : string; { ���Խð� }
    FKioskIp                : string; { �ɻ��IP }
    FName                   : string; { �̸� }
    FBirth                  : string; { ������� }
    FPassNo                 : string; { ���ǹ�ȣ }
    FPassExpDate            : string; { ���Ǹ������� }
    FSex                    : string; { ���� }
    FNatCd                  : string; { �����ڵ� }
    FModiNatCd              : string; { ���������ڵ� }
    FFgnGb                  : string; { �ܱ��α��� }
    FVisaNo                 : string; { ������ȣ }
    FVisaSearchGb           : string; { ������ȸ���� }
    FEdCardNo               : string; { ���Ա��Ű���ȣ }
    FEdCardOcrNo            : string; { ���Ա��Ű�OCR��ȣ }
    FFlightno               : string; { ��� }
    FOffiCd                 : string; { �繫���ڵ� }
    FJudgeGb                : string; { �ɻ籸�� }
    FJudgerId               : string; { �ɻ���ID }
    FSealNo                 : string; { �ɻ��ι�ȣ }
    FCitzYn                 : string; { ��ܱ��ο��� }
    FIntlEventCd            : string; { ��������ڵ� }
    FIntlEventAttendGbCd    : string; { ����������������ڵ� }
    FCont                   : string; { ����ó }
    FFirstImmiGb            : string; { �����̹α��� }
    FFirstAdoptGb           : string; { �����Ծ籸�� }
    FRem                    : string; { ��� }
    FMrpChar88              : string; { MRP88�� }
    FMrpImg                 : string; { MRP�̹��� }
    FBatchStat              : string; { ��ġó������ }
    FEdCrimeYn              : string; { ���Ա�������� }
    FExile                  : string; { ��� }
    FDepOrder               : string; { �ⱹ��� }
    FEtc                    : string; { ��Ÿ }
    FPerfectDep             : string; { �����ⱹ }
    FRegbYn                 : string; { �żҿ��� }
    FSojQualCd              : string; { ü���ڰ��ڵ� }
    FSojPeriod              : string; { ü���Ⱓ }
    FSojExprDate            : string; { ü���������� }
    FReEntPeriod            : string; { ���Ա��Ⱓ }
    FFgnRegYn               : string; { �ܱ��ε�Ͽ��� }
    FFgnRegNo               : string; { �ܱ��ε�Ϲ�ȣ }
    FVisaExtYn              : string; { ������������ }
    FVisaExist              : string; { �������� }
    FPassExist              : string; { �������� }
    FEntDate                : string; { �Ա����� }
    FErrMsg                 : string; { �����޽��� }
    FPassFullImg            : string; { ���������̹��� }
    FEdCardFullImg          : string; { ���Ա��Ű������̹��� }
    FPhotoUpExist           : string; { �������ε����� }
    FProcGb                 : string; { ó������ }
    FRepSojQualCd           : string; { ��з�ü���ڰ��ڵ� }
    FSubSojQualCd           : string; { �Һз�ü���ڰ��ڵ� }
    FEpassChipPhoto         : string; { ���ڿ���Ĩ���� }
    FEpassSuccYn            : string; { ���ڿ��Ǽ������� }
    FEpassErrCd             : string; { ���ڿ��ǿ����ڵ� }
    FEpassChipName          : string; { ���ڿ���Ĩ�̸� }
    FEpassAuthPeriod        : string; { ���ڿ����ǵ��Ⱓ }
    FEpassIssNat            : string; { ���ڿ��ǹ߱ޱ��� }
    FEpassNatMainKey        : string; { ���ڿ��Ǳ�����Ư��Ű }
    FEpassIssDate           : string; { ���ڿ��ǹ߱����� }
    FEpassDg1Dg16           : string; { ���ڿ���DG1DG16 }
    FEpassChipEf            : string; { ���ڿ���ĨEF }
    FEpassChipSod           : string; { ���ڿ���ĨSOD }
    FMrpDevGb               : string; { �����ǵ�����񱸺� }
    FEpassBacGb             : string; { ���ڿ���BAC���� }
    FEpassAaGb              : string; { ���ڿ���AA���� }
    FEpassCaGb              : string; { ���ڿ���CA���� }
    FEpassPaGb              : string; { ���ڿ���PA���� }
    FEpassTaGb              : string; { ���ڿ���TA���� }
    FEpassMrpChar88         : string; { ���ڿ���MRP88�� }
    FOptAuthTime            : string; { �����ǵ��ð� }
    FJudgeDbProcTime        : string; { �ɻ�DBó���ð� }
    FFgnTelNo               : string; { �ܱ�����ȭ��ȣ }
    FFgnAddr                : string; { �ܱ����ּ� }
    FFgnStatGb              : string; { �ܱ��λ��±��� }
    FProcId                 : string; { ó����ID }
    FProcDtm                : TDateTime; { ó���Ͻ� }
    FFlagType               : string;
    FResFlag                : string;
    FResMsg                 : string;
    procedure SetTableName(const Value: string);
    procedure SetEdGb(const Value: string);
    procedure SetEdDate(const Value: string);
    procedure SetEdTime(const Value: string);
    procedure SetKioskIp(const Value: string);
    procedure SetName(const Value: string);
    procedure SetBirth(const Value: string);
    procedure SetPassNo(const Value: string);
    procedure SetPassExpDate(const Value: string);
    procedure SetSex(const Value: string);
    procedure SetNatCd(const Value: string);
    procedure SetModiNatCd(const Value: string);
    procedure SetFgnGb(const Value: string);
    procedure SetVisaNo(const Value: string);
    procedure SetVisaSearchGb(const Value: string);
    procedure SetEdCardNo(const Value: string);
    procedure SetEdCardOcrNo(const Value: string);
    procedure SetFlightno(const Value: string);
    procedure SetOffiCd(const Value: string);
    procedure SetJudgeGb(const Value: string);
    procedure SetJudgerId(const Value: string);
    procedure SetSealNo(const Value: string);
    procedure SetCitzYn(const Value: string);
    procedure SetIntlEventCd(const Value: string);
    procedure SetIntlEventAttendGbCd(const Value: string);
    procedure SetCont(const Value: string);
    procedure SetFirstImmiGb(const Value: string);
    procedure SetFirstAdoptGb(const Value: string);
    procedure SetRem(const Value: string);
    procedure SetMrpChar88(const Value: string);
    procedure SetMrpImg(const Value: string);
    procedure SetBatchStat(const Value: string);
    procedure SetEdCrimeYn(const Value: string);
    procedure SetExile(const Value: string);
    procedure SetDepOrder(const Value: string);
    procedure SetEtc(const Value: string);
    procedure SetPerfectDep(const Value: string);
    procedure SetRegbYn(const Value: string);
    procedure SetSojQualCd(const Value: string);
    procedure SetSojPeriod(const Value: string);
    procedure SetSojExprDate(const Value: string);
    procedure SetReEntPeriod(const Value: string);
    procedure SetFgnRegYn(const Value: string);
    procedure SetFgnRegNo(const Value: string);
    procedure SetVisaExtYn(const Value: string);
    procedure SetVisaExist(const Value: string);
    procedure SetPassExist(const Value: string);
    procedure SetEntDate(const Value: string);
    procedure SetErrMsg(const Value: string);
    procedure SetPassFullImg(const Value: string);
    procedure SetEdCardFullImg(const Value: string);
    procedure SetPhotoUpExist(const Value: string);
    procedure SetProcGb(const Value: string);
    procedure SetRepSojQualCd(const Value: string);
    procedure SetSubSojQualCd(const Value: string);
    procedure SetEpassChipPhoto(const Value: string);
    procedure SetEpassSuccYn(const Value: string);
    procedure SetEpassErrCd(const Value: string);
    procedure SetEpassChipName(const Value: string);
    procedure SetEpassAuthPeriod(const Value: string);
    procedure SetEpassIssNat(const Value: string);
    procedure SetEpassNatMainKey(const Value: string);
    procedure SetEpassIssDate(const Value: string);
    procedure SetEpassDg1Dg16(const Value: string);
    procedure SetEpassChipEf(const Value: string);
    procedure SetEpassChipSod(const Value: string);
    procedure SetMrpDevGb(const Value: string);
    procedure SetEpassBacGb(const Value: string);
    procedure SetEpassAaGb(const Value: string);
    procedure SetEpassCaGb(const Value: string);
    procedure SetEpassPaGb(const Value: string);
    procedure SetEpassTaGb(const Value: string);
    procedure SetEpassMrpChar88(const Value: string);
    procedure SetOptAuthTime(const Value: string);
    procedure SetJudgeDbProcTime(const Value: string);
    procedure SetFgnTelNo(const Value: string);
    procedure SetFgnAddr(const Value: string);
    procedure SetFgnStatGb(const Value: string);
    procedure SetProcId(const Value: string);
    procedure SetProcDtm(const Value: TDateTime);
    procedure SetFlagType(const Value: string);
    procedure SetResFlag(const Value: string);
    procedure SetResMsg(const Value: string);
  public
  published
    property tableName            : string           read FTableName               write SetTableName;
    property edGb                 : string           read FEdGb                    write SetEdGb;
    property edDate               : string           read FEdDate                  write SetEdDate;
    property edTime               : string           read FEdTime                  write SetEdTime;
    property kioskIp              : string           read FKioskIp                 write SetKioskIp;
    property name                 : string           read FName                    write SetName;
    property birth                : string           read FBirth                   write SetBirth;
    property passNo               : string           read FPassNo                  write SetPassNo;
    property passExpDate          : string           read FPassExpDate             write SetPassExpDate;
    property sex                  : string           read FSex                     write SetSex;
    property natCd                : string           read FNatCd                   write SetNatCd;
    property modiNatCd            : string           read FModiNatCd               write SetModiNatCd;
    property fgnGb                : string           read FFgnGb                   write SetFgnGb;
    property visaNo               : string           read FVisaNo                  write SetVisaNo;
    property visaSearchGb         : string           read FVisaSearchGb            write SetVisaSearchGb;
    property edCardNo             : string           read FEdCardNo                write SetEdCardNo;
    property edCardOcrNo          : string           read FEdCardOcrNo             write SetEdCardOcrNo;
    property flightno             : string           read FFlightno                write SetFlightno;
    property offiCd               : string           read FOffiCd                  write SetOffiCd;
    property judgeGb              : string           read FJudgeGb                 write SetJudgeGb;
    property judgerId             : string           read FJudgerId                write SetJudgerId;
    property sealNo               : string           read FSealNo                  write SetSealNo;
    property citzYn               : string           read FCitzYn                  write SetCitzYn;
    property intlEventCd          : string           read FIntlEventCd             write SetIntlEventCd;
    property intlEventAttendGbCd  : string           read FIntlEventAttendGbCd     write SetIntlEventAttendGbCd;
    property cont                 : string           read FCont                    write SetCont;
    property firstImmiGb          : string           read FFirstImmiGb             write SetFirstImmiGb;
    property firstAdoptGb         : string           read FFirstAdoptGb            write SetFirstAdoptGb;
    property rem                  : string           read FRem                     write SetRem;
    property mrpChar88            : string           read FMrpChar88               write SetMrpChar88;
    property mrpImg               : string           read FMrpImg                  write SetMrpImg;
    property batchStat            : string           read FBatchStat               write SetBatchStat;
    property edCrimeYn            : string           read FEdCrimeYn               write SetEdCrimeYn;
    property exile                : string           read FExile                   write SetExile;
    property depOrder             : string           read FDepOrder                write SetDepOrder;
    property etc                  : string           read FEtc                     write SetEtc;
    property perfectDep           : string           read FPerfectDep              write SetPerfectDep;
    property regbYn               : string           read FRegbYn                  write SetRegbYn;
    property sojQualCd            : string           read FSojQualCd               write SetSojQualCd;
    property sojPeriod            : string           read FSojPeriod               write SetSojPeriod;
    property sojExprDate          : string           read FSojExprDate             write SetSojExprDate;
    property reEntPeriod          : string           read FReEntPeriod             write SetReEntPeriod;
    property fgnRegYn             : string           read FFgnRegYn                write SetFgnRegYn;
    property fgnRegNo             : string           read FFgnRegNo                write SetFgnRegNo;
    property visaExtYn            : string           read FVisaExtYn               write SetVisaExtYn;
    property visaExist            : string           read FVisaExist               write SetVisaExist;
    property passExist            : string           read FPassExist               write SetPassExist;
    property entDate              : string           read FEntDate                 write SetEntDate;
    property errMsg               : string           read FErrMsg                  write SetErrMsg;
    property passFullImg          : string           read FPassFullImg             write SetPassFullImg;
    property edCardFullImg        : string           read FEdCardFullImg           write SetEdCardFullImg;
    property photoUpExist         : string           read FPhotoUpExist            write SetPhotoUpExist;
    property procGb               : string           read FProcGb                  write SetProcGb;
    property repSojQualCd         : string           read FRepSojQualCd            write SetRepSojQualCd;
    property subSojQualCd         : string           read FSubSojQualCd            write SetSubSojQualCd;
    property epassChipPhoto       : string           read FEpassChipPhoto          write SetEpassChipPhoto;
    property epassSuccYn          : string           read FEpassSuccYn             write SetEpassSuccYn;
    property epassErrCd           : string           read FEpassErrCd              write SetEpassErrCd;
    property epassChipName        : string           read FEpassChipName           write SetEpassChipName;
    property epassAuthPeriod      : string           read FEpassAuthPeriod         write SetEpassAuthPeriod;
    property epassIssNat          : string           read FEpassIssNat             write SetEpassIssNat;
    property epassNatMainKey      : string           read FEpassNatMainKey         write SetEpassNatMainKey;
    property epassIssDate         : string           read FEpassIssDate            write SetEpassIssDate;
    property epassDg1Dg16         : string           read FEpassDg1Dg16            write SetEpassDg1Dg16;
    property epassChipEf          : string           read FEpassChipEf             write SetEpassChipEf;
    property epassChipSod         : string           read FEpassChipSod            write SetEpassChipSod;
    property mrpDevGb             : string           read FMrpDevGb                write SetMrpDevGb;
    property epassBacGb           : string           read FEpassBacGb              write SetEpassBacGb;
    property epassAaGb            : string           read FEpassAaGb               write SetEpassAaGb;
    property epassCaGb            : string           read FEpassCaGb               write SetEpassCaGb;
    property epassPaGb            : string           read FEpassPaGb               write SetEpassPaGb;
    property epassTaGb            : string           read FEpassTaGb               write SetEpassTaGb;
    property epassMrpChar88       : string           read FEpassMrpChar88          write SetEpassMrpChar88;
    property optAuthTime          : string           read FOptAuthTime             write SetOptAuthTime;
    property judgeDbProcTime      : string           read FJudgeDbProcTime         write SetJudgeDbProcTime;
    property fgnTelNo             : string           read FFgnTelNo                write SetFgnTelNo;
    property fgnAddr              : string           read FFgnAddr                 write SetFgnAddr;
    property fgnStatGb            : string           read FFgnStatGb               write SetFgnStatGb;
    property procId               : string           read FProcId                  write SetProcId;
    property procDtm              : TDateTime        read FProcDtm                 write SetProcDtm;
    property flagType             : string           read FFlagType                write SetFlagType;
    property resFlag              : string           read FResFlag                 write SetResFlag;
    property resMsg               : string           read FResMsg                  write SetResMsg;
  end;

implementation


{ THistObj }
procedure THistObj.SetEdGb(const Value: string);
begin
  FEdGb := Value;
end;

procedure THistObj.SetEdDate(const Value: string);
begin
  FEdDate := Value;
end;

procedure THistObj.SetEdTime(const Value: string);
begin
  FEdTime := Value;
end;

procedure THistObj.SetKioskIp(const Value: string);
begin
  FKioskIp := Value;
end;

procedure THistObj.SetName(const Value: string);
begin
  FName := Value;
end;

procedure THistObj.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure THistObj.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure THistObj.SetPassExpDate(const Value: string);
begin
  FPassExpDate := Value;
end;

procedure THistObj.SetSex(const Value: string);
begin
  FSex := Value;
end;

procedure THistObj.SetNatCd(const Value: string);
begin
  FNatCd := Value;
end;

procedure THistObj.SetModiNatCd(const Value: string);
begin
  FModiNatCd := Value;
end;

procedure THistObj.SetFgnGb(const Value: string);
begin
  FFgnGb := Value;
end;

procedure THistObj.SetVisaNo(const Value: string);
begin
  FVisaNo := Value;
end;

procedure THistObj.SetVisaSearchGb(const Value: string);
begin
  FVisaSearchGb := Value;
end;

procedure THistObj.SetEdCardNo(const Value: string);
begin
  FEdCardNo := Value;
end;

procedure THistObj.SetEdCardOcrNo(const Value: string);
begin
  FEdCardOcrNo := Value;
end;

procedure THistObj.SetFlightno(const Value: string);
begin
  FFlightno := Value;
end;

procedure THistObj.SetOffiCd(const Value: string);
begin
  FOffiCd := Value;
end;

procedure THistObj.SetJudgeGb(const Value: string);
begin
  FJudgeGb := Value;
end;

procedure THistObj.SetJudgerId(const Value: string);
begin
  FJudgerId := Value;
end;

procedure THistObj.SetSealNo(const Value: string);
begin
  FSealNo := Value;
end;

procedure THistObj.SetCitzYn(const Value: string);
begin
  FCitzYn := Value;
end;

procedure THistObj.SetIntlEventCd(const Value: string);
begin
  FIntlEventCd := Value;
end;

procedure THistObj.SetIntlEventAttendGbCd(const Value: string);
begin
  FIntlEventAttendGbCd := Value;
end;

procedure THistObj.SetCont(const Value: string);
begin
  FCont := Value;
end;

procedure THistObj.SetFirstImmiGb(const Value: string);
begin
  FFirstImmiGb := Value;
end;

procedure THistObj.SetFirstAdoptGb(const Value: string);
begin
  FFirstAdoptGb := Value;
end;

procedure THistObj.SetRem(const Value: string);
begin
  FRem := Value;
end;

procedure THistObj.SetMrpChar88(const Value: string);
begin
  FMrpChar88 := Value;
end;

procedure THistObj.SetMrpImg(const Value: string);
begin
  FMrpImg := Value;
end;

procedure THistObj.SetBatchStat(const Value: string);
begin
  FBatchStat := Value;
end;

procedure THistObj.SetEdCrimeYn(const Value: string);
begin
  FEdCrimeYn := Value;
end;

procedure THistObj.SetExile(const Value: string);
begin
  FExile := Value;
end;

procedure THistObj.SetDepOrder(const Value: string);
begin
  FDepOrder := Value;
end;

procedure THistObj.SetEtc(const Value: string);
begin
  FEtc := Value;
end;

procedure THistObj.SetPerfectDep(const Value: string);
begin
  FPerfectDep := Value;
end;

procedure THistObj.SetRegbYn(const Value: string);
begin
  FRegbYn := Value;
end;

procedure THistObj.SetSojQualCd(const Value: string);
begin
  FSojQualCd := Value;
end;

procedure THistObj.SetSojPeriod(const Value: string);
begin
  FSojPeriod := Value;
end;

procedure THistObj.SetSojExprDate(const Value: string);
begin
  FSojExprDate := Value;
end;

procedure THistObj.SetReEntPeriod(const Value: string);
begin
  FReEntPeriod := Value;
end;

procedure THistObj.SetFgnRegYn(const Value: string);
begin
  FFgnRegYn := Value;
end;

procedure THistObj.SetFgnRegNo(const Value: string);
begin
  FFgnRegNo := Value;
end;

procedure THistObj.SetVisaExtYn(const Value: string);
begin
  FVisaExtYn := Value;
end;

procedure THistObj.SetVisaExist(const Value: string);
begin
  FVisaExist := Value;
end;

procedure THistObj.SetPassExist(const Value: string);
begin
  FPassExist := Value;
end;

procedure THistObj.SetEntDate(const Value: string);
begin
  FEntDate := Value;
end;

procedure THistObj.SetErrMsg(const Value: string);
begin
  FErrMsg := Value;
end;

procedure THistObj.SetPassFullImg(const Value: string);
begin
  FPassFullImg := Value;
end;

procedure THistObj.SetEdCardFullImg(const Value: string);
begin
  FEdCardFullImg := Value;
end;

procedure THistObj.SetPhotoUpExist(const Value: string);
begin
  FPhotoUpExist := Value;
end;

procedure THistObj.SetProcGb(const Value: string);
begin
  FProcGb := Value;
end;

procedure THistObj.SetRepSojQualCd(const Value: string);
begin
  FRepSojQualCd := Value;
end;

procedure THistObj.SetSubSojQualCd(const Value: string);
begin
  FSubSojQualCd := Value;
end;

procedure THistObj.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

procedure THistObj.SetEpassChipPhoto(const Value: string);
begin
  FEpassChipPhoto := Value;
end;

procedure THistObj.SetEpassSuccYn(const Value: string);
begin
  FEpassSuccYn := Value;
end;

procedure THistObj.SetEpassErrCd(const Value: string);
begin
  FEpassErrCd := Value;
end;

procedure THistObj.SetEpassChipName(const Value: string);
begin
  FEpassChipName := Value;
end;

procedure THistObj.SetEpassAuthPeriod(const Value: string);
begin
  FEpassAuthPeriod := Value;
end;

procedure THistObj.SetEpassIssNat(const Value: string);
begin
  FEpassIssNat := Value;
end;

procedure THistObj.SetEpassNatMainKey(const Value: string);
begin
  FEpassNatMainKey := Value;
end;

procedure THistObj.SetEpassIssDate(const Value: string);
begin
  FEpassIssDate := Value;
end;

procedure THistObj.SetEpassDg1Dg16(const Value: string);
begin
  FEpassDg1Dg16 := Value;
end;

procedure THistObj.SetEpassChipEf(const Value: string);
begin
  FEpassChipEf := Value;
end;

procedure THistObj.SetEpassChipSod(const Value: string);
begin
  FEpassChipSod := Value;
end;

procedure THistObj.SetMrpDevGb(const Value: string);
begin
  FMrpDevGb := Value;
end;

procedure THistObj.SetEpassBacGb(const Value: string);
begin
  FEpassBacGb := Value;
end;

procedure THistObj.SetEpassAaGb(const Value: string);
begin
  FEpassAaGb := Value;
end;

procedure THistObj.SetEpassCaGb(const Value: string);
begin
  FEpassCaGb := Value;
end;

procedure THistObj.SetEpassPaGb(const Value: string);
begin
  FEpassPaGb := Value;
end;

procedure THistObj.SetEpassTaGb(const Value: string);
begin
  FEpassTaGb := Value;
end;

procedure THistObj.SetEpassMrpChar88(const Value: string);
begin
  FEpassMrpChar88 := Value;
end;

procedure THistObj.SetOptAuthTime(const Value: string);
begin
  FOptAuthTime := Value;
end;

procedure THistObj.SetJudgeDbProcTime(const Value: string);
begin
  FJudgeDbProcTime := Value;
end;

procedure THistObj.SetFgnTelNo(const Value: string);
begin
  FFgnTelNo := Value;
end;

procedure THistObj.SetFgnAddr(const Value: string);
begin
  FFgnAddr := Value;
end;

procedure THistObj.SetFgnStatGb(const Value: string);
begin
  FFgnStatGb := Value;
end;

procedure THistObj.SetProcId(const Value: string);
begin
  FProcId := Value;
end;

procedure THistObj.SetProcDtm(const Value: TDateTime);
begin
  FProcDtm := Value;
end;

procedure THistObj.SetFlagType(const Value: string);
begin
  FFlagType := Value;
end;

procedure THistObj.SetResFlag(const Value: string);
begin
  FResFlag := Value;
end;

procedure THistObj.SetResMsg(const Value: string);
begin
  FResMsg := Value;
end;


end.
