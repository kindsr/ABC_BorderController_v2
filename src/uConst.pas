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
  SERVER_ADDRESS = 'http://192.168.3.142:8050'; // ���߼���
//  SERVER_ADDRESS = 'http://192.168.3.62:8080'; // ���߼���

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
	ABC_FUNCTION_NOT_SUPPORTED   = -1;		// �������� �ʴ� �Լ�
	ABC_ERROR_MEMORY_ALLOC       = -2;		// �޸� �Ҵ� ����
	ABC_NOT_IMAGE_FORMAT         = -3;		// ������ ���� ������ �ƴ�.
	ABC_IMAGE_SIZE_ZERO          = -4;		// ���� ����� 0�� ���.
	ABC_NOT_SUPPORTED_TYPE       = -5;
	ABC_FAIL                     =  0;		// ����
	ABC_SUCCESS                  =  1;		// ����

	MAX_DEVICE = 10;												// �ý��ۿ� �����Ǿ� �ִ� ����
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

	// �̹��� ����
	ABC_IMAGE_TYPE = (
		IT_RAW,				// RAW format
		IT_BITMAP,			// Bitmap format
		IT_JPG,				// JPG format
		IT_WSQ,				// WSQ format
		IT_ISO19794_4,		// finger image data standard format. ISO19794-4 format
		IT_ISO19794_5,		// face image data standard format. ISO19794-5 format
		IT_ETC				// ��Ÿ ���� ����.( ex. finger thin image, clear image. etc )
	);

// �̹��� ����
	ABC_IMAGE_INFO = packed record
		iImageType	: Integer;		// �̹��� ����, ABC_IMAGE_TYPE
		iWidth		: Integer;		// ����
		iHeight		: Integer;		// ����
		iSize		: Integer;		// ������ ũ��
	end;

	PABC_IMAGE_INFO = ^ABC_IMAGE_INFO;

// �̹���
	ABC_IMAGE = packed record
		info	: ABC_IMAGE_INFO;			  // �̹��� ����
		data	: Pointer;		          // ������. info.iImageType�� ���� �׸��� ����� ������.
	end;

	PABC_IMAGE = ^ABC_IMAGE;

// ��Ʈ��ũ ���� ���
  ABC_NETWORK_TYPE = (
    NT_SERVER,       // Server mode
    NT_CLIENT        // Client mode
  );

  ABC_NETWORK_INFO = packed record
    iNetworkType      : Integer;                    // ���� ���
    server_ip         : Array [0..99] of AnsiChar;  // NT_CLIENT�� ��� server ip
    server_base_port  : Integer;                    // base port number. base_port = command, base_port+1 = preview etc.
    retry             : Integer;                    // NT_CLIENT�� ��� connect retry
    timeout           : Integer;                    // NT_CLIENT�� ��� connection timeout
  end;

type
// ��� ��� ����
	ABC_DEVICE_INFO = packed record
		iDeviceCount  : Integer;										// �ش� ��� ����
		strDeviceName : array[0..MAX_DEVICE-1, 0..256-1] of AnsiChar;	// ����(Source)
	end;
	PABC_DEVICE_INFO = ^ABC_DEVICE_INFO;

// device callback���� ���Ǵ� ��� ����
	ABC_DEVICE_TYPE = (
		ABC_DT_FINGER,													// ���� ��� ���
		ABC_DT_FACE,													// �� �Կ� ���
		ABC_DT_PASSPORT													// ���ڿ����ǵ� ���
	);

// device callback event
	ABC_DEVICE_STATUS = (
		DS_REMOVE,														// USB��� �ý��� ���� ����
		DS_ARRIVAL														// USB��� �ý��� ���� �Ϸ�
	);

// Algorithm ����
const
	MAX_ALGORITHM	= 10;                   // �˰��� ��

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

// ��� ���� ���� ��ȭ ����
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

