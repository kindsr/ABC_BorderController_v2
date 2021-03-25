unit PaxInfo;

interface

uses Classes;

{Class for Objects}

type
  TArrAnsiChar=array[0..20480] of AnsiChar;

  TPAXInfo = class(TObject)
  private
    FRegNo                  : string; { 16�ڸ� ��Ϲ�ȣ }
    FName                   : string; { 39�ڸ� �ǵ����� }
    FBirth                  : string; { 08�ڸ� �ǵ�������� }
    FSex                    : string; { 01�ڸ� ���� }
    FNatCd                  : string; { 03�ڸ� ���� }
    FModiNatCd              : string; { 03�ڸ� �������� }
    FJuminNo                : string; { 07�ڸ� �ֹι�ȣ }
    FEdGb                   : string; { 1�ڸ� ���Ա����� }
    FJobGb                  : string; { 1�ڸ� 1:�Ϲݿ���,2:���ڿ���,3:�¹��� }
    FPassNo                 : string; { 20�ڸ� ���ǹ�ȣ }
    FPassChgYn              : string; { 1�ڸ� �������� }
    FPassIssueDate          : string; { 08�ڸ� ���ǻ����� }
    FPassExpDate            : string; { 08�ڸ� ���Ǹ����� }
    FHwInterfaceStat        : string; { 02�ڸ� �ϵ���� ó������ }
    FCheckDigitGb           : string; { 01�ڸ�  �ǵ����� CHECK_DIGIT  A :����,B :�ǵ����� }
    FMrzChar88              : string; { 88�ڸ� mrz 88�ڸ� }
    FServiceYn              : string; { 01�ڸ� ���񽺴�󿩺� }
    FServiceCd              : string; { 03�ڸ� ���񽺴���ڵ� }
    FJudgeYn                : string; { 01�ڸ� �ɻ����忩�� }
    FJudgeGb                : string; { 01�ڸ� �ɻ籸�� }
    FResJudgeGb             : string; { 03�ڸ� �ɻ��� }
    FResJudgeText           : string; { 20�ڸ� �ɻ������� }
    FMrpPhotoImgLen         : string; { 06�ڸ�  ���ǻ������� }
    FMrpPhotoImg            : string; { ���ǻ����� �¹��� ��ϻ��� }
    FPaxGb                  : string; { �°����� }
    FCrewNo                 : string; { �¹�����Ϲ�ȣ }
    FFingerIndex            : string; { 02�ڸ� �����ε��� }
    FLeftFnSpecLen          : string; { 06�ڸ� ���ʵ������Ư¡�� ���� }
    FLeftFnSpec             : TArrAnsiChar; { ���ʵ������Ư¡�� }
    FLeftFnQuality          : Integer;{ ���ʵ������ǰ�� }
    FRightFnSpecLen         : string; { 06�ڸ� �����ʵ������Ư¡�� ���� }
    FRightFnSpec            : TArrAnsiChar; { �����ʵ������Ư¡�� }
    FRightFnQuality         : Integer; { �����ʵ������ǰ�� }
    FFaceImgLen             : string; { ��Ͼȸ��̹��� ���� }
    FFaceImg                : string; { ��Ͼȸ��̹��� }
    FCurFnSpecLen           : string; { 06�ڸ� ��ĵ����Ư¡�� ���� }
    FCurFnSpec              : TArrAnsiChar; { ��ĵ����Ư¡�� }
    FCurFnQuality           : Integer; { ��ĵ����ǰ�� }
    FCurFaceImgLen          : string; { �Կ��ȸ��̹��� ���� }
    FCurFaceImg             : string; { �Կ��ȸ��̹��� }
    FFnTryCnt               : string; { �����õ�Ƚ�� }
    FFnMatchYn              : string; { ������ġ���� }
    FFnLeftScore            : string; { ������������ }
    FFnRightScore           : string; { �������������� }
    FFaceTryCnt             : string; { �ȸ�õ�Ƚ�� }
    FFaceMatchYn            : string; { �ȸ���ġ���� }
    FFaceScore              : string; { �ȸ����� }
    FEntOpenYn              : string; { �Ա��������� }
    FEntOpenDtm             : TDateTime; { �Ա������ð� }
    FExtOpenYn              : string; { �ⱸ�������� }
    FExtOpenDtm             : TDateTime; { �ⱸ�����ð� }
    FBaggageYn              : string; { ���������� }
    FCallYn                 : string; { ȣ�⿩�� }
    procedure SetRegNo(const Value: string);
    procedure SetName(const Value: string);
    procedure SetBirth(const Value: string);
    procedure SetSex(const Value: string);
    procedure SetNatCd(const Value: string);
    procedure SetModiNatCd(const Value: string);
    procedure SetJuminNo(const Value: string);
    procedure SetEdGb(const Value: string);
    procedure SetJobGb(const Value: string);
    procedure SetPassNo(const Value: string);
    procedure SetPassChgYn(const Value: string);
    procedure SetPassIssueDate(const Value: string);
    procedure SetPassExpDate(const Value: string);
    procedure SetHwInterfaceStat(const Value: string);
    procedure SetCheckDigitGb(const Value: string);
    procedure SetMrzChar88(const Value: string);
    procedure SetServiceYn(const Value: string);
    procedure SetServiceCd(const Value: string);
    procedure SetJudgeYn(const Value: string);
    procedure SetJudgeGb(const Value: string);
    procedure SetResJudgeGb(const Value: string);
    procedure SetResJudgeText(const Value: string);
    procedure SetMrpPhotoImgLen(const Value: string);
    procedure SetMrpPhotoImg(const Value: string);
    procedure SetPaxGb(const Value: string);
    procedure SetCrewNo(const Value: string);
    procedure SetLeftFnSpecLen(const Value: string);
    procedure SetLeftFnSpec(const Value: TArrAnsiChar);
    procedure SetRightFnSpecLen(const Value: string);
    procedure SetRightFnSpec(const Value: TArrAnsiChar);
    procedure SetFaceImgLen(const Value: string);
    procedure SetFaceImg(const Value: string);
    procedure SetCurFnSpecLen(const Value: string);
    procedure SetCurFnSpec(const Value: TArrAnsiChar);
    procedure SetCurFaceImgLen(const Value: string);
    procedure SetCurFaceImg(const Value: string);
    procedure SetFnTryCnt(const Value: string);
    procedure SetFnMatchYn(const Value: string);
    procedure SetFnLeftScore(const Value: string);
    procedure SetFnRightScore(const Value: string);
    procedure SetFaceTryCnt(const Value: string);
    procedure SetFaceMatchYn(const Value: string);
    procedure SetFaceScore(const Value: string);
    procedure SetEntOpenYn(const Value: string);
    procedure SetEntOpenDtm(const Value: TDateTime);
    procedure SetExtOpenYn(const Value: string);
    procedure SetExtOpenDtm(const Value: TDateTime);
    procedure SetBaggageYn(const Value: string);
    procedure SetCallYn(const Value: string);
    procedure SetFingerIndex(const Value: string);
    procedure SetLeftFnQuality(const Value: Integer);
    procedure SetRightFnQuality(const Value: Integer);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    property regNo               : string          read FRegNo              write SetRegNo;
    property name                : string          read FName               write SetName;
    property birth               : string          read FBirth              write SetBirth;
    property sex                 : string          read FSex                write SetSex;
    property natCd               : string          read FNatCd              write SetNatCd;
    property modiNatCd           : string          read FModiNatCd          write SetModiNatCd;
    property juminNo             : string          read FJuminNo            write SetJuminNo;
    property edGb                : string          read FEdGb               write SetEdGb;
    property jobGb               : string          read FJobGb              write SetJobGb;
    property passNo              : string          read FPassNo             write SetPassNo;
    property passChgYn           : string          read FPassChgYn          write SetPassChgYn;
    property passIssueDate       : string          read FPassIssueDate      write SetPassIssueDate;
    property passExpDate         : string          read FPassExpDate        write SetPassExpDate;
    property hwInterfaceStat     : string          read FHwInterfaceStat    write SetHwInterfaceStat;
    property checkDigitGb        : string          read FCheckDigitGb       write SetCheckDigitGb;
    property mrzChar88           : string          read FMrzChar88          write SetMrzChar88;
    property serviceYn           : string          read FServiceYn          write SetServiceYn;
    property serviceCd           : string          read FServiceCd          write SetServiceCd;
    property judgeYn             : string          read FJudgeYn            write SetJudgeYn;
    property judgeGb             : string          read FJudgeGb            write SetJudgeGb;
    property resJudgeGb          : string          read FResJudgeGb         write SetResJudgeGb;
    property resJudgeText        : string          read FResJudgeText       write SetResJudgeText;
    property mrpPhotoImgLen      : string          read FMrpPhotoImgLen     write SetMrpPhotoImgLen;
    property mrpPhotoImg         : string          read FMrpPhotoImg        write SetMrpPhotoImg;
    property paxGb               : string          read FPaxGb              write SetPaxGb;
    property crewNo              : string          read FCrewNo             write SetCrewNo;
    property fingerIndex         : string          read FFingerIndex        write SetFingerIndex;
    property leftFnSpecLen       : string          read FLeftFnSpecLen      write SetLeftFnSpecLen;
    property leftFnSpec          : TArrAnsiChar    read FLeftFnSpec         write SetLeftFnSpec;
    property leftFnQuality       : Integer         read FLeftFnQuality      write SetLeftFnQuality;
    property rightFnSpecLen      : string          read FRightFnSpecLen     write SetRightFnSpecLen;
    property rightFnSpec         : TArrAnsiChar    read FRightFnSpec        write SetRightFnSpec;
    property rightFnQuality      : Integer         read FRightFnQuality     write SetRightFnQuality;
    property faceImgLen          : string          read FFaceImgLen         write SetFaceImgLen;
    property faceImg             : string          read FFaceImg            write SetFaceImg;
    property curFnSpecLen        : string          read FCurFnSpecLen       write SetCurFnSpecLen;
    property curFnSpec           : TArrAnsiChar    read FCurFnSpec          write SetCurFnSpec;
    property curFaceImgLen       : string          read FCurFaceImgLen      write SetCurFaceImgLen;
    property curFaceImg          : string          read FCurFaceImg         write SetCurFaceImg;
    property fnTryCnt            : string          read FFnTryCnt           write SetFnTryCnt;
    property fnMatchYn           : string          read FFnMatchYn          write SetFnMatchYn;
    property fnLeftScore         : string          read FFnLeftScore        write SetFnLeftScore;
    property fnRightScore        : string          read FFnRightScore       write SetFnRightScore;
    property faceTryCnt          : string          read FFaceTryCnt         write SetFaceTryCnt;
    property faceMatchYn         : string          read FFaceMatchYn        write SetFaceMatchYn;
    property faceScore           : string          read FFaceScore          write SetFaceScore;
    property entOpenYn           : string          read FEntOpenYn          write SetEntOpenYn;
    property entOpenDtm          : TDateTime       read FEntOpenDtm         write SetEntOpenDtm;
    property extOpenYn           : string          read FExtOpenYn          write SetExtOpenYn;
    property extOpenDtm          : TDateTime       read FExtOpenDtm         write SetExtOpenDtm;
    property baggageYn           : string          read FBaggageYn          write SetBaggageYn;
    property callYn              : string          read FCallYn             write SetCallYn;
end;


implementation

{ TPAXInfo }

constructor TPAXInfo.Create;
begin
  inherited;
end;

destructor TPAXInfo.Destroy;
begin
  inherited;
end;

procedure TPAXInfo.Clear;
begin
  FRegNo           := '';
  FName            := '';
  FBirth           := '';
  FSex             := '';
  FNatCd           := '';
  FModiNatCd       := '';
  FJuminNo         := '';
  FEdGb            := '';
  FJobGb           := '';
  FPassNo          := '';
  FPassChgYn       := '';
  FPassIssueDate   := '';
  FPassExpDate     := '';
  FHwInterfaceStat := '';
  FCheckDigitGb    := '';
  FMrzChar88       := '';
end;

procedure TPAXInfo.SetResJudgeGb(const Value: string);
begin
  FResJudgeGb := Value;
end;

procedure TPAXInfo.SetResJudgeText(const Value: string);
begin
  FResJudgeText := Value;
end;

procedure TPAXInfo.SetBaggageYn(const Value: string);
begin
  FBaggageYn := Value;
end;

procedure TPAXInfo.SetBirth(const Value: string);
begin
  FBirth := Value;
end;

procedure TPAXInfo.SetMrzChar88(const Value: string);
begin
  FMrzChar88 := Value;
end;

procedure TPAXInfo.SetLeftFnQuality(const Value: Integer);
begin
  FLeftFnQuality := Value;
end;

procedure TPAXInfo.SetLeftFnSpec(const Value: TArrAnsiChar);
begin
  FLeftFnSpec := Value;
end;

procedure TPAXInfo.SetCrewNo(const Value: string);
begin
  FCrewNo := Value;
end;

procedure TPAXInfo.SetCurFaceImg(const Value: string);
begin
  FCurFaceImg := Value;
end;

procedure TPAXInfo.SetCurFaceImgLen(const Value: string);
begin
  FCurFaceImgLen := Value;
end;

procedure TPAXInfo.SetCurFnSpec(const Value: TArrAnsiChar);
begin
  FCurFnSpec := Value;
end;

procedure TPAXInfo.SetCurFnSpecLen(const Value: string);
begin
  FCurFnSpecLen := Value;
end;

procedure TPAXInfo.SetEdGb(const Value: string);
begin
  FEdGb := Value;
end;

procedure TPAXInfo.SetEntOpenDtm(const Value: TDateTime);
begin
  FEntOpenDtm := Value;
end;

procedure TPAXInfo.SetEntOpenYn(const Value: string);
begin
  FEntOpenYn := Value;
end;

procedure TPAXInfo.SetExtOpenDtm(const Value: TDateTime);
begin
  FExtOpenDtm := Value;
end;

procedure TPAXInfo.SetExtOpenYn(const Value: string);
begin
  FExtOpenYn := Value;
end;

procedure TPAXInfo.SetHwInterfaceStat(const Value: string);
begin
  FHwInterfaceStat := Value;
end;

procedure TPAXInfo.SetJudgeGb(const Value: string);
begin
  FJudgeGb := Value;
end;

procedure TPAXInfo.SetJudgeYn(const Value: string);
begin
  FJudgeYn := Value;
end;

procedure TPAXInfo.SetJobGb(const Value: string);
begin
  FJobGb := Value;
end;

procedure TPAXInfo.SetFaceImg(const Value: string);
begin
  FFaceImg := Value;
end;

procedure TPAXInfo.SetJuminNo(const Value: string);
begin
  FJuminNo := Value;
end;

procedure TPAXInfo.SetServiceCd(const Value: string);
begin
  FServiceCd := Value;
end;

procedure TPAXInfo.SetModiNatCd(const Value: string);
begin
  FModiNatCd := Value;
end;

procedure TPAXInfo.SetMrpPhotoImg(const Value: string);
begin
  FMrpPhotoImg := Value;
end;

procedure TPAXInfo.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TPAXInfo.SetNatCd(const Value: string);
begin
  FNatCd := Value;
end;

procedure TPAXInfo.SetPaxGb(const Value: string);
begin
  FPaxGb := Value;
end;

procedure TPAXInfo.SetPassExpDate(const Value: string);
begin
  FPassExpDate := Value;
end;

procedure TPAXInfo.SetPassChgYn(const Value: string);
begin
  FPassChgYn := Value;
end;

procedure TPAXInfo.SetPassIssueDate(const Value: string);
begin
  FPassIssueDate := Value;
end;

procedure TPAXInfo.SetPassNo(const Value: string);
begin
  FPassNo := Value;
end;

procedure TPAXInfo.SetFaceImgLen(const Value: string);
begin
  FFaceImgLen := Value;
end;

procedure TPAXInfo.SetFaceScore(const Value: string);
begin
  FFaceScore := Value;
end;

procedure TPAXInfo.SetFaceMatchYn(const Value: string);
begin
  FFaceMatchYn := Value;
end;

procedure TPAXInfo.SetFaceTryCnt(const Value: string);
begin
  FFaceTryCnt := Value;
end;

procedure TPAXInfo.SetFingerIndex(const Value: string);
begin
  FFingerIndex := Value;
end;

procedure TPAXInfo.SetCallYn(const Value: string);
begin
  FCallYn := Value;
end;

procedure TPAXInfo.SetCheckDigitGb(const Value: string);
begin
  FCheckDigitGb := Value;
end;

procedure TPAXInfo.SetRegNo(const Value: string);
begin
  FRegNo := Value;
end;

procedure TPAXInfo.SetFnTryCnt(const Value: string);
begin
  FFnTryCnt := Value;
end;

procedure TPAXInfo.SetFnLeftScore(const Value: string);
begin
  FFnLeftScore := Value;
end;

procedure TPAXInfo.SetFnMatchYn(const Value: string);
begin
  FFnMatchYn := Value;
end;

procedure TPAXInfo.SetFnRightScore(const Value: string);
begin
  FFnRightScore := Value;
end;

procedure TPAXInfo.SetRightFnQuality(const Value: Integer);
begin
  FRightFnQuality := Value;
end;

procedure TPAXInfo.SetRightFnSpec(const Value: TArrAnsiChar);
begin
  FRightFnSpec := Value;
end;

procedure TPAXInfo.SetRightFnSpecLen(const Value: string);
begin
  FRightFnSpecLen := Value;
end;

procedure TPAXInfo.SetSex(const Value: string);
begin
  FSex := Value;
end;

procedure TPAXInfo.SetMrpPhotoImgLen(const Value: string);
begin
  FMrpPhotoImgLen := Value;
end;

procedure TPAXInfo.SetServiceYn(const Value: string);
begin
  FServiceYn := Value;
end;

procedure TPAXInfo.SetLeftFnSpecLen(const Value: string);
begin
  FLeftFnSpecLen := Value;
end;

end.
