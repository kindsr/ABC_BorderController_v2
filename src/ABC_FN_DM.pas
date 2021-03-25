{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit ABC_FN_DM;

interface

uses
	Messages, Windows, uConst;

const
	WM_FN_DEVICE                        = (WM_USER+200);

// finger device return status
	ABC_FN_NOT_INIT_SDK                = -901;
	ABC_FN_NOT_EXIST_DEVICE            = -902;
	ABC_FN_NOT_FOUND_SOURCE            = -903;
	ABC_FN_ALREADY_OPENED              = -904;
	ABC_FN_NOT_CONNECT_DEVICE          = -905;
	ABC_FN_NOT_LIVE_MODE               = -906;
	ABC_FN_SELECT_SOURCE_FIRST         = -907;
	ABC_FN_CONNECT_ERROR               = -908;
	ABC_FN_THREAD_MAKE_FAIL            = -909;
	ABC_FN_MEMORY_ALLOC_ERROR          = -910;
	ABC_FN_CAPTURE_FAIL                = -911;
	ABC_FN_DOING_TAKE                  = -912;
	ABC_FN_NOT_CAPTURED                = -913;
	ABC_FN_ALREADY_ACTION              = -914;
	ABC_FN_CAPTURE_TIMEOUT             = -915;
	ABC_FN_CAPTURE_CANCELED            = -916;
	ABC_FN_NOT_SUPPORTED_CAPTURE_TYPE  = -917;

// finger algorithm return status
	GCAM_FN_NOT_INIT_SDK          = -901;
	GCAM_FN_NOT_OPEN              = -902;
	GCAM_FN_PARAMETER_FAIL        = -903;
	GCAM_FN_EXTRACT_FAIL          = -904;
	GCAM_FN_NOT_MATCHED           = -905;
	GCAM_FN_INVALID_FEATURE       = -906;
	GCAM_FN_INVALID_IMAGE_FORMAT  = -907;
	GCAM_FN_ALREADY_ACTION        = -908;
	GCAM_FN_NOT_CONNECT_ALGORITHM = -909;
	GCAM_FN_NOT_EXIST_ALGORITHM   = -910;
	GCAM_FN_ALREADY_OPENED        = -911;
	GCAM_FN_NOT_FOUND_ALGORITHM   = -912;
	GCAM_FN_NOT_EXTRACT           = -913;

// common return status
const
	ABC_FUNCTION_NOT_SUPPORTED   = -1;		// 지원하지 않는 함수
	ABC_ERROR_MEMORY_ALLOC       = -2;		// 메모리 할당 실패
	ABC_NOT_IMAGE_FORMAT         = -3;		// 지정된 영상 포맷이 아님.
	ABC_IMAGE_SIZE_ZERO          = -4;		// 영상 사이즈가 0인 경우.
	ABC_NOT_SUPPORTED_TYPE       = -5;
	ABC_FAIL                     =  0;		// 실패
	ABC_SUCCESS                  =  1;		// 성공

	// minutia type
	MT_ENDING                     = 0;
	MT_BIFURCATION                = 1;

	// core-vector type
	CT_DELTA                      = 0;
	CT_CORE                       = 1;

	// param type
	PT_DPI                        = 0;
	PT_IMPRESSIONTYPE             = 1;
	PT_WIDTH                      = 2;
	PT_HEIGHT                     = 3;
	PT_MATCH_LEVEL                = 4;


type
	ABC_CAPTURE_TYPE = (
		CT_PLANE_FOUR,
		CT_PLANE_TWO,
		CT_PLANE_ONE,
		CT_ROLL_ONE
	);

	ABC_FN_IMAGE = packed record
		ctype		  : Integer; // ABC_CAPTURE_TYPE
		plane		  : ABC_IMAGE;
		fingers 	: Integer;
    segimages : ABC_IMAGE; //Array of ABC_IMAGE;
		spoof		  : PCardinal;
		NFIQ		  : PCardinal;
	end;
	PABC_FN_IMAGE = ^ABC_FN_IMAGE;

	ABC_FN_DEVICE_CAPS = packed record
		bEnableFour		: Integer;
		bEnableTwo		: Integer;
		bEnableOne		: Integer;
		bEnablePlane	: Integer;
		bEnableRoll		: Integer;
		iWidth			  : Integer;
		iHeight			  : Integer;
		iDPI			    : Integer;
	end;
	PABC_FN_DEVICE_CAPS = ^ABC_FN_DEVICE_CAPS;

// ABC_FN Message : WPARAM 정의
	FN_DEV_MSSG_WPARAM_DEFINE = (
		WP_FN_ERROR,
		WP_FN_OPEN,
		WP_FN_CLOSE,
		WP_FN_NO_FINGER,
		WP_FN_FINGER_OK,
		WP_FN_MOVE_LEFT,
		WP_FN_MOVE_RIGHT,
		WP_FN_MOVE_UP,
		WP_FN_MOVE_DOWN,
		WP_FN_PROCESS
	);

type
	// feature item position 정보
	ABC_FN_FEATURE_ITEM = packed record
		x	  : SmallInt;					// x position
		y	  : SmallInt;					// y position
		dir : SmallInt;					// direction. algorithm마다 적용방식 다를수 있음.
	end;
	PABC_FN_FEATURE_ITEM = ^ABC_FN_FEATURE_ITEM;


	// minutia
	ABC_FN_MINUTIA = packed record
		item	: ABC_FN_FEATURE_ITEM;	// position
		kind	: BYTE;					// 종류. MT_ENDING, MT_BIFURCATION, CT_CORE, CT_VECTOR
	end;
	PABC_FN_MINUTIA = ^ABC_FN_MINUTIA;

	// minutiae
	ABC_FN_MINUTIAE = packed record
		iCount	: Integer;				// minutia 수
		items	  : Array of ABC_FN_MINUTIA;		// minutia 정보
	end;
	PABC_FN_MINUTIAE = ^ABC_FN_MINUTIAE;

	// core, vector 정보
	ABC_FN_COREDELTA = ABC_FN_MINUTIAE;
	PABC_FN_COREDELTA = ^ABC_FN_COREDELTA;

	// 일치점 정보
	ABC_FN_HIT_INFO = packed record
		iHitCount	: BYTE;				// verify count
		p_id		  : PBYTE;			// probe minutia index
		g_id		  : PBYTE;			// gallary minutia index
	end;
	PABC_FN_HIT_INFO = ^ABC_FN_HIT_INFO;

{Finger Device}
function FNS_InitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_RegisterDeviceStatusCallback( callback : ABC_DeviceStatusCallback; pParent : Pointer ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_GetDeviceCount( bRefresh : Integer; iDeviceCount : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_GetDeviceSource( info : PABC_DEVICE_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_GetLastError( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_ErrorToDescription( context : ABC_Context; iErrCode : Integer ) : PAnsiChar; stdcall;
	external 'ABC_Device.dll';

function FNS_CreateContext( pContext : PABC_Context; devicesource : PAnsiChar ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DestroyContext( pContext : PABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_DeviceOpen( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DeviceClose( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_GetDeviceCaps( context : ABC_Context; caps : PABC_FN_DEVICE_CAPS ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_GetImageParams( context : ABC_Context; iWidth, iHeight : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_RegisterPreviewCallback( context : ABC_Context; callback : ABC_PreviewCallback; pParent : Pointer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_UnregisterPreviewCallback( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_RegisterMessageHandle( context : ABC_Context;  hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_UnregisterMessageHandle( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_AppendPreview( context : ABC_Context; hWnd : HWND; rPos : TRect ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DeletePreview( context : ABC_Context; hWnd : HWND ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_Capture( context : ABC_Context; ctype : Integer; iTimeout : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_Cancel( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNS_GetCapturedImage( context : ABC_Context; images : PABC_FN_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';

// make buffer
function FNS_MakeImage( image_type, iWidth, iHeight : Integer; image : PAnsiChar; image_size : Integer; outImage : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';

// free buffer
procedure FNS_FreeFingerImage( image : PABC_FN_IMAGE ) ; stdcall;
	external 'ABC_Device.dll';
procedure FNS_FreeImage( image : PABC_IMAGE ) ; stdcall;
	external 'ABC_Device.dll';

// RAW <-> ISO19794-4
function FNS_RawToIso( context : ABC_Context; raw : PABC_IMAGE; iso : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_IsoToRaw( context : ABC_Context; iso : PABC_IMAGE; raw : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_ConvertRawToBMP(raw : PABC_IMAGE; bmp : PABC_IMAGE) : Integer; stdcall;
	external 'ABC_Device.dll';

// 전체 context 제어
function FNS_CreateContextAll( config : PAnsiChar ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DestroyContextAll : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DeviceOpenAll : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_DeviceCloseAll : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_CaptureAll( ctype : Integer; iTimeout : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNS_CancelAll : Integer; stdcall;
	external 'ABC_Device.dll';

{ Finger algorithm}

function FNA_InitSDK : Integer ; stdcall;
	external 'ABC_Device.dll';
function FNA_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetAlgorithmCount( iCount : PInteger  ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetAlgorithms( info : PABC_ALG_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNA_GetLastError( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_ErrorToDescription( context : ABC_Context; iErrCode : Integer ) : PAnsiChar ; stdcall;
	external 'ABC_Device.dll';

function FNA_CreateContext( pContext : PABC_Context; algorithm_name : PAnsiChar ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_DestroyContext( pContext : PABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function FNA_Open( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_Close( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// set, get parameters
function FNA_SetParam( context : ABC_Context; iParamType, iValue : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetParam( context : ABC_Context; iParamType : Integer; iValue : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';

// extract
function FNA_Extract( context : ABC_Context; image : PABC_IMAGE; iPosition : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetQuality( context : ABC_Context; iQuality : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetMinutiaCount( context : ABC_Context; iCount : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetFeature( context : ABC_Context; feature : PABC_FEATURE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetThinImage( context : ABC_Context; thin : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetClearImage( context : ABC_Context; clear : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetMinutiae( context : ABC_Context; feature : PABC_FEATURE; minutiae : PABC_FN_MINUTIAE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetCoreDelta( context : ABC_Context; feature : PABC_FEATURE; cores : PABC_FN_COREDELTA ) : Integer; stdcall;
	external 'ABC_Device.dll';
// 2016-12-01 dyddyd 표준화추가
function FNA_ISOExtract( context : ABC_Context; image : PABC_IMAGE; feature : PABC_FEATURE ) : Integer; stdcall;
	external 'ABC_Device.dll';

// verification
function FNA_Verify( context : ABC_Context; query : PABC_FEATURE; target : PABC_FEATURE; score : PSingle; bResult : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_GetHitInfo( context : ABC_Context; hit  : PABC_FN_HIT_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';

// make buffer
function FNA_MakeFeature( context : ABC_Context; feature : PBYTE; feature_size : Integer; outFeature : PABC_FEATURE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FNA_MakeImage( image_type, iWidth, iHeight : Integer; image : PBYTE; image_size : Integer ; outImage : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';

// free buffer
procedure  FNA_FreeFeature( feature : PABC_FEATURE ) ; stdcall;
	external 'ABC_Device.dll';
procedure  FNA_FreeImage( image : PABC_IMAGE ) ; stdcall;
	external 'ABC_Device.dll';
procedure  FNA_FreeMinutiae( minutiae : PABC_FN_MINUTIAE ) ; stdcall;
	external 'ABC_Device.dll';
procedure  FNA_FreeCoreDelta( cores : PABC_FN_COREDELTA ) ; stdcall;
	external 'ABC_Device.dll';
procedure  FNA_FreeHitInfo( hit : PABC_FN_HIT_INFO ) ; stdcall;
	external 'ABC_Device.dll';


implementation

end.






