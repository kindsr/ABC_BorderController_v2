{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}
unit uConst;

{$IFDEF DEBUG}
  {.$DEFINE  __NOSERVICE}
  {.$DEFINE  __NOSERVICELOG}
  {.$DEFINE  __NODISPLAY}
  {.$DEFINE  __NOEQUIPMENT__DCU}
  {.$DEFINE  __NOEQUIPMENT__PASSPORT}
  {.$DEFINE  __NOEQUIPMENT__FINGER}
  {.$DEFINE  __NOEQUIPMENT__FNALG}
  {.$DEFINE  __NOEQUIPMENT__CAMERA}
  {.$DEFINE __NOEQUIPMENT__2PERSON}
  {.$DEFINE __NOEQUIPMENT__LIGHT}
  {.$DEFINE __NOEQUIPMENT__RFCARD}
  {.$DEFINE __AUTOTEST}
  {.$DEFINE AUTOUPDATE}
{$ELSE}
  {.$DEFINE __NOEQUIPMENT__2PERSON}
{$ENDIF}

interface

uses
	Messages, Classes, PaxInfo, Windows;

const
  SERVER_ADDRESS = 'http://192.168.3.142:8050'; // 개발서버
//  SERVER_ADDRESS = 'http://192.168.3.62:8080'; // 개발서버

const
  NOSERVICE_VALUE = {$IFDEF __NOSERVICE} True; {$ELSE} False; {$ENDIF}
  NOSERVICELOG_VALUE = {$IFDEF __NOSERVICELOG} True; {$ELSE} False; {$ENDIF}
  NODISPLAY_VALUE = {$IFDEF __NODISPLAY} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_DCU_VALUE = {$IFDEF __NOEQUIPMENT__DCU} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_PASSPORT_VALUE = {$IFDEF __NOEQUIPMENT__PASSPORT} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_FINGER_VALUE = {$IFDEF __NOEQUIPMENT__FINGER} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_FNALG_VALUE = {$IFDEF __NOEQUIPMENT__FNALG} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_CAMERA_VALUE = {$IFDEF __NOEQUIPMENT__CAMERA} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_2PERSON_VALUE = {$IFDEF __NOEQUIPMENT__2PERSON} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_LIGHT_VALUE = {$IFDEF __NOEQUIPMENT__LIGHT} True; {$ELSE} False; {$ENDIF}
  NOEQUIPMENT_RFCARD_VALUE = {$IFDEF __NOEQUIPMENT__RFCARD} True; {$ELSE} False; {$ENDIF}
  AUTOTEST_VALUE = {$IFDEF __AUTOTEST} True; {$ELSE} False; {$ENDIF}
  AUTOUPDATE_VALUE = {$IFDEF AUTOUPDATE} True; {$ELSE} False; {$ENDIF}

// common return status
const
	ABC_FUNCTION_NOT_SUPPORTED   = -1;		// 지원하지 않는 함수
	ABC_ERROR_MEMORY_ALLOC       = -2;		// 메모리 할당 실패
	ABC_NOT_IMAGE_FORMAT         = -3;		// 지정된 영상 포맷이 아님.
	ABC_IMAGE_SIZE_ZERO          = -4;		// 영상 사이즈가 0인 경우.
	ABC_NOT_SUPPORTED_TYPE       = -5;
	ABC_FAIL                     =  0;		// 실패
	ABC_SUCCESS                  =  1;		// 성공

	MAX_DEVICE = 10;												// 시스템에 장착되어 있는 장비수
  MAX_SENSOR = 128;

  CL_LIME = $0032FF4E;
  CL_RED  = $001900F2;
  CL_BLUE = $00D90448;
  CL_YELLOW = $0013F2EB;
  CL_FACE = $00F0B27F;
  CL_BTNCOLOR = $00A26509;

  WM_CHECKOBJ = WM_USER + 8800;
  WM_CHECKPAX = WM_USER + 8900;

type
  PAXDETECT_MSG_WPARAM_DEFINE = (
    PAXDETECT_FAIL,
    PAXDETECT_SUCCESS,
    PAXDETECT_START,
    PAXDETECT_STOP
  );

type
  OBJDETECT_MSG_WPARAM_DEFINE = (
    OBJDETECT_FAIL,
    OBJDETECT_SUCCESS,
    OBJDETECT_START,
    OBJDETECT_STOP
  );

type
  TClearArea = (caAll, caAction, caDevice, caLog, caSensor);
  TClsArea = set of TClearArea;
  TFlashSet = (fsAll, fsMain, fsSub);
  TProcessABC = (paInit, paReading, paPassport, paPassportFail, paDoorFront, paWalkThStart, paScanning, paFinger, paFingerFail, paWalkThEnd, paTaking, paCamera, paCameraFail, paDoorRear, paDetecting, pa2P, pa2PFail);

type
  TConfigInfo = record
    OverlayMode: Boolean;
    Animation: Boolean;
    CompactWidth: Integer;
    SkinComboIndex: Integer;
    Maximize: Boolean;
    Sizable: Boolean;
    StayOnTop: Boolean;
    ShowFlash: Boolean;
  end;

type
	ABC_Context = Pointer;					// Device or Algorithm Context

	PABC_Context = ^ABC_Context;

	// 이미지 형식
	ABC_IMAGE_TYPE = (
		IT_RAW,				// RAW format
		IT_BITMAP,			// Bitmap format
		IT_JPG,				// JPG format
		IT_WSQ,				// WSQ format
		IT_ISO19794_4,		// finger image data standard format. ISO19794-4 format
		IT_ISO19794_5,		// face image data standard format. ISO19794-5 format
		IT_ETC				// 기타 영상 정보.( ex. finger thin image, clear image. etc )
	);

// 이미지 정보
	ABC_IMAGE_INFO = packed record
		iImageType	: Integer;		// 이미지 형식, ABC_IMAGE_TYPE
		iWidth		: Integer;		// 넓이
		iHeight		: Integer;		// 높이
		iSize		: Integer;		// 데이터 크기
	end;

	PABC_IMAGE_INFO = ^ABC_IMAGE_INFO;

// 이미지
	ABC_IMAGE = packed record
		info	: ABC_IMAGE_INFO;			  // 이미지 정보
		data	: Pointer;		          // 데이터. info.iImageType에 따라서 그리는 방식이 정해짐.
	end;

	PABC_IMAGE = ^ABC_IMAGE;

// 네트워크 동작 방식
  ABC_NETWORK_TYPE = (
    NT_SERVER,       // Server mode
    NT_CLIENT        // Client mode
  );

  ABC_NETWORK_INFO = packed record
    iNetworkType      : Integer;                    // 동작 방식
    server_ip         : Array [0..99] of AnsiChar;  // NT_CLIENT일 경우 server ip
    server_base_port  : Integer;                    // base port number. base_port = command, base_port+1 = preview etc.
    retry             : Integer;                    // NT_CLIENT일 경우 connect retry
    timeout           : Integer;                    // NT_CLIENT일 경우 connection timeout
  end;

type
// 장비 목록 정보
	ABC_DEVICE_INFO = packed record
		iDeviceCount  : Integer;										// 해당 장비 갯수
		strDeviceName : array[0..MAX_DEVICE-1, 0..256-1] of AnsiChar;	// 장비명(Source)
	end;
	PABC_DEVICE_INFO = ^ABC_DEVICE_INFO;

// device callback에서 사용되는 장비 형식
	ABC_DEVICE_TYPE = (
		ABC_DT_FINGER,													// 지문 취득 장비
		ABC_DT_FACE,													// 얼굴 촬영 장비
		ABC_DT_PASSPORT													// 전자여권판독 장비
	);

// device callback event
	ABC_DEVICE_STATUS = (
		DS_REMOVE,														// USB장비 시스템 접속 해제
		DS_ARRIVAL														// USB장비 시스템 접속 완료
	);

// Algorithm 관련
const
	MAX_ALGORITHM	= 10;                   // 알고리즘 수

type
	ABC_ALG_INFO = packed record
		algorithm_count	: Integer;
		algorithm_name	: array[0..MAX_ALGORITHM-1, 0..256-1] of AnsiChar;
	end;

	PABC_ALG_INFO = ^ABC_ALG_INFO;

	ABC_FEATURE_TYPE = (
		FT_FINGER,
		FT_FACE
	);

	ABC_FEATURE_INFO = packed record
		ftype			: Integer;                            // ABC_FEATURE_TYPE
		algorithm_name	: array[0..256-1] of AnsiChar;
		iSize			: Integer;
	end;

	PABC_FEATURE_INFO = ^ABC_FEATURE_INFO;

	ABC_FEATURE = packed record
		info	: ABC_FEATURE_INFO;
		data	: Pointer;
	end;

	PABC_FEATURE = ^ABC_FEATURE;

//=============================================================================
// Callbacks
//=============================================================================
// preview callback
	ABC_PreviewCallback = procedure( pContext : Pointer; image : PABC_IMAGE ); stdcall;

// 장비 접속 상태 변화 감지
	ABC_DeviceStatusCallback = procedure( pParent : Pointer; iDevice : Integer; iStatus : Integer; _unit : PAnsiChar; source : PAnsiChar ); stdcall;

var
  FPaxInfo : TPAXInfo;
  ini_directory : string; // ini directory
  log_directory : string; // log directory
  media_directory : string; // media directory

implementation

initialization
  FPaxInfo := TPAXInfo.Create;

finalization
  if FPaxInfo <> nil then FPaxInfo.Free;

end.

