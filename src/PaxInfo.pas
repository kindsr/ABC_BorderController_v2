unit PaxInfo;

interface

uses Classes;

{Class for Objects}

type
  TArrAnsiChar=array[0..20480] of AnsiChar;

  TPAXInfo = class(TObject)
  private
    FRegNo                  : string; { 16자리 등록번호 }
    FName                   : string; { 39자리 판독성명 }
    FBirth                  : string; { 08자리 판독생년월일 }
    FSex                    : string; { 01자리 성별 }
    FNatCd                  : string; { 03자리 국적 }
    FModiNatCd              : string; { 03자리 보정국적 }
    FJuminNo                : string; { 07자리 주민번호 }
    FEdGb                   : string; { 1자리 출입국구분 }
    FJobGb                  : string; { 1자리 1:일반여권,2:전자여권,3:승무원 }
    FPassNo                 : string; { 20자리 여권번호 }
    FPassChgYn              : string; { 1자리 보정여부 }
    FPassIssueDate          : string; { 08자리 여권생성일 }
    FPassExpDate            : string; { 08자리 여권만료일 }
    FHwInterfaceStat        : string; { 02자리 하드웨어 처리상태 }
    FCheckDigitGb           : string; { 01자리  판독여권 CHECK_DIGIT  A :정상,B :판독오류 }
    FMrzChar88              : string; { 88자리 mrz 88자리 }
    FServiceYn              : string; { 01자리 서비스대상여부 }
    FServiceCd              : string; { 03자리 서비스대상코드 }
    FJudgeYn                : string; { 01자리 심사저장여부 }
    FJudgeGb                : string; { 01자리 심사구분 }
    FResJudgeGb             : string; { 03자리 심사결과 }
    FResJudgeText           : string; { 20자리 심사결과내용 }
    FMrpPhotoImgLen         : string; { 06자리  여권사진길이 }
    FMrpPhotoImg            : string; { 여권사진및 승무원 등록사진 }
    FPaxGb                  : string; { 승객구분 }
    FCrewNo                 : string; { 승무원등록번호 }
    FFingerIndex            : string; { 02자리 지문인덱스 }
    FLeftFnSpecLen          : string; { 06자리 왼쪽등록지문특징점 길이 }
    FLeftFnSpec             : TArrAnsiChar; { 왼쪽등록지문특징점 }
    FLeftFnQuality          : Integer;{ 왼쪽등록지문품질 }
    FRightFnSpecLen         : string; { 06자리 오른쪽등록지문특징점 길이 }
    FRightFnSpec            : TArrAnsiChar; { 오른쪽등록지문특징점 }
    FRightFnQuality         : Integer; { 오른쪽등록지문품질 }
    FFaceImgLen             : string; { 등록안면이미지 길이 }
    FFaceImg                : string; { 등록안면이미지 }
    FCurFnSpecLen           : string; { 06자리 스캔지문특징점 길이 }
    FCurFnSpec              : TArrAnsiChar; { 스캔지문특징점 }
    FCurFnQuality           : Integer; { 스캔지문품질 }
    FCurFaceImgLen          : string; { 촬영안면이미지 길이 }
    FCurFaceImg             : string; { 촬영안면이미지 }
    FFnTryCnt               : string; { 지문시도횟수 }
    FFnMatchYn              : string; { 지문일치여부 }
    FFnLeftScore            : string; { 왼쪽지문점수 }
    FFnRightScore           : string; { 오른쪽지문점수 }
    FFaceTryCnt             : string; { 안면시도횟수 }
    FFaceMatchYn            : string; { 안면일치여부 }
    FFaceScore              : string; { 안면점수 }
    FEntOpenYn              : string; { 입구열림여부 }
    FEntOpenDtm             : TDateTime; { 입구열림시간 }
    FExtOpenYn              : string; { 출구열림여부 }
    FExtOpenDtm             : TDateTime; { 출구열림시간 }
    FBaggageYn              : string; { 짐감지여부 }
    FCallYn                 : string; { 호출여부 }
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
