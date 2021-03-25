{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit ABC_FC_DM;

interface

uses
	Messages, Windows, uConst;

const
  // face device return status
  WM_FCNC_DEVICE 					  = (WM_USER+700);
  ABC_NM_NOT_INIT          = -901;
  ABC_NM_ERROR_CONNECT     = -902;
  ABC_NM_ERROR_DISCONNECT  = -903;
  ABC_NM_ERROR_REQUEST     = -904;
  ABC_NM_ERROR_GETRESULT   = -905;
  ABC_NM_ERROR_GET2PRESULT = -906;

  // face algorithm return status
	GCAM_FC_NOT_INIT_SDK          = -901;
	GCAM_FC_NOT_OPEN              = -902;
	GCAM_FC_SET_PARAM_FAIL        = -903;
	GCAM_FC_NOT_FOUND_FACE        = -904;
	GCAM_FC_EXTRACT_FAIL          = -905;
	GCAM_FC_NOT_MATCHED           = -906;
	GCAM_FC_INVALID_FEATURE       = -907;
	GCAM_FC_INVALID_BITMAP_FORMAT = -908;
	GCAM_FC_ALREADY_ACTION        = -909;
	GCAM_FC_NOT_CONNECT_ALGORITHM = -910;
	GCAM_FC_NOT_EXIST_ALGORITHM   = -911;
	GCAM_FC_ALREADY_OPENED        = -912;
	GCAM_FC_NOT_FOUND_ALGORITHM   = -913;

  // 2 person detection
  WM_FCNC_PASSENGERDETECT   = (WM_USER+1100);

type
  FCNC_DEV_MSSG_WPARAM_DEFINE = (
    WP_FACE_OPEN,             // for client side
    WP_FACE_CLOSE,
    WP_FACE_VERIFY,
    WP_FACE_ERROR,
    WP_2PEOPLE_START,
    WP_2PEOPLE_STOP,
    WP_2PEOPLE_RESULT,
    WP_FACE_PREVERIFY         // 2016-01-18 dyddyd Walkthrough 추가
  );

type
  PASSENGERDETECT_MSG_WPARAM_DEFINE = (
    DETECT_FAIL,
    DETECT_SUCCESS,
    DETECT_START,
    DETECT_STOP
  );

  ABC_FCNC_FACE_ERROR = packed record
    iCamIndex   : Integer;
    iErrorCode  : Integer;
  end;

type
// ABC_CA Message : WPARAM 정의
	CA_DEV_MSSG_WPARAM_DEFINE = (
	  WP_CA_START_DETECT,
	  WP_CA_END_DETECT,
	  WP_CA_EXTRACT,
	  WP_CA_VERIFY
	);

	ABC_DETECT_DATA = packed record
	  FaceRoll		: Single;
	  FaceScore		: Single;
	  HeadScore		: Single;

	  FacePos		  : TRect;
	  HeadPos		  : TRect;

	  LeftEye		  : TPoint;
	  RightEye		: TPoint;

	  EyeDistance	: Integer;
	end;

	PABC_DETECT_DATA = ^ABC_DETECT_DATA;

	ABC_DETECT_RESULT = packed record
		iFound		: Integer;
		result		: Array of ABC_DETECT_DATA;
	end;

	PABC_DETECT_RESULT = ^ABC_DETECT_RESULT;

function FCC_Kiosk_InitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_Kiosk_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_Kiosk_RegisterMessageHandle( hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_Kiosk_ConnectServer( info : ABC_NETWORK_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_Kiosk_DisconnectServer : Integer; stdcall;
	external 'ABC_Device.dll';


function FCC_InitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function FCC_GetLastError : Integer; stdcall;
	external 'ABC_Device.dll';

function FCC_RegisterMessageHandle( hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_UnregisterMessageHandle : Integer; stdcall;
	external 'ABC_Device.dll';

function FCC_ConnectServer( info : ABC_NETWORK_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_DisconnectServer : Integer; stdcall;
	external 'ABC_Device.dll';

//function FCC_RequestVerify( gallary1 : PABC_IMAGE; gallary2 : PABC_IMAGE ) : Integer; stdcall;
// 2017-01-20 dyddyd 표준화 기준점수 파라메터 추가
function FCC_RequestVerify( gallary1 : PABC_IMAGE; gallary2 : PABC_IMAGE; fScore : Single ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_RequestFaceVerify( gallary1 : PABC_IMAGE; gallary2 : PABC_IMAGE; fScore : Single ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_GetVerifyResult( iCamIndex : PInteger; iGallary : PInteger; fScore : PSingle; prob :PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
// 2017-01-20 dyddyd 표준화 안면 사전촬영 추가
function FCC_PreVerify( gallary1 : PABC_IMAGE; gallary2 : PABC_IMAGE; fScore : Single ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_StopPreVerify() : Integer; stdcall;
	external 'ABC_Device.dll';

procedure FCC_MakeImage( const iType : Integer; const data : PAnsiChar; const iSize : Integer; image : PABC_IMAGE ); stdcall;
	external 'ABC_Device.dll';
procedure FCC_FreeImage( image : PABC_IMAGE ); stdcall;
	external 'ABC_Device.dll';

function FCC_SaveImageBuffer(szFileName : PAnsiChar) : Integer; stdcall;
	external 'ABC_Device.dll';

// 2인 감지
function FCC_2PStart: Integer; stdcall;
	external 'ABC_Device.dll';
procedure FCC_2PStop; stdcall;
	external 'ABC_Device.dll';
function FCC_Get2PResult( iResult : PInteger; prob : PABC_IMAGE; faceinfo : PABC_DETECT_RESULT ) : Integer; stdcall;
	external 'ABC_Device.dll';
function FCC_FreeFaceInfo( faceinfo : PABC_DETECT_RESULT ) : Integer; stdcall;
	external 'ABC_Device.dll';


implementation

end.



