{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit ABC_PS_DM;

interface

uses
	Messages, Windows, uConst;

const
	WM_PS_DEVICE        				      = (WM_USER+300);
  WM_RF_DEVICE                      = (WM_USER+7001);
//	WM_PS_DEVICE        				      = (WM_USER+2001);

	ABC_PS_NOT_INIT_SDK				      = -901;
	ABC_PS_NOT_EXIST_DEVICE			    = -902;
	ABC_PS_NOT_FOUND_SOURCE			    = -903;
	ABC_PS_NOT_CONNECT_DEVICE			  = -904;
	ABC_PS_NOT_LIVE_MODE				      = -905;
	ABC_PS_NOT_SCANNED					      = -906;
	ABC_PS_SELECT_SOURCE_FIRST			  = -907;
	ABC_PS_CONNECT_ERROR				      = -908;
	ABC_PS_ALREADY_OPENED				    = -909;
	ABC_PS_THREAD_MAKE_FAIL			    = -910;
	ABC_PS_MEMORY_ALLOC_ERROR			  = -911;
	ABC_PS_DOC_READ_FAIL				      = -912;
	ABC_PS_ALREADY_ACTION				    = -913;
	ABC_PS_INVALID_PARAM				      = -914;
	ABC_PS_ALREADY_DOING_DETECT		  = -915;
	ABC_PS_UNKNOWN_DOCUMENT			    = -916;
	ABC_PS_ERROR_DOCUMENT_TYPE			  = -917;
	ABC_PS_ERROR_READ_VZ_MRZ			    = -918;
	ABC_PS_ERROR_READ_E_DOC_MRZ		  = -919;
	ABC_PS_ERROR_READ_RF_MRZ			    = -920;
	ABC_PS_ERROR_CONVERT_MRZ			    = -921;
	ABC_PS_ERROR_READ_E_DOC_RESULT		= -922;
	ABC_PS_ERROR_READ_RF_CARD_RESULT	= -923;
  ABC_PS_ERROR_READ_EDOC           = -924;

	MAX_MRZ_LINE_SIZE					= 64;

	MAX_BACODE_DATA_SIZE			= 1024;
	MAX_BARCODE_COUNT					= 2;

	// Read Document Mode
	SM_WH 			      = $01;
	SM_IR 			      = $02;
	SM_UV 			      = $04;
	SM_BARCODE	      = $08;
	SM_EPASS		      = $10;
	SM_RFCARD		      = $20;

	// Read Doc Method.
	READ_MANUAL		    = 1;
	READ_AUTO		      = 2;

	// passport image type
	PIT_VZ_SCAN        = 0;
	PIT_VZ_MRZ         = 1;
	PIT_VZ_PHOTO       = 2;
	PIT_IR             = 3;
	PIT_WH             = 4;
	PIT_UV             = 5;
	PIT_E_PHOTO        = 6;
	PIT_E_FINGER1      = 7;
	PIT_E_FINGER2      = 8;
	PIT_RF_PHOTO       = 9;

	// Document type
	DOC_TYPE_NO                 = 0;
	DOC_TYPE_KOR_PASS           = 1;
	DOC_TYPE_FOREIGN_PASS       = 2;
	DOC_TYPE_VISA               = 3;
	DOC_TYPE_NONE_ICAO          = 4;
	DOC_TYPE_KOR_E_PASS         = 5;
	DOC_TYPE_FOREIGN_E_PASS     = 6;
	DOC_TYPE_UNKNOWN            = 7;

	// barcode type
	BT_UNKNOWN         = 0;
	BT_CODE39          = 1;
	BT_CODE128         = 2;
	BT_PDF417          = 3;
	BT_QRCODE          = 4;
	BT_DATAMATRIX      = 5;

	// RF-Card type
	RFC_UNKNOWN        = 0;
	RFC_ICAOLITE       = 1;

	// Get Data type
	DT_DOC_TYPE         = 0;
	DT_MRZ              = 1;
	DT_MRZ_DATA         = 2;
	DT_E_MRZ            = 3;
	DT_E_MRZ_DATA       = 4;
	DT_E_RESULT         = 5;
	DT_RF_MRZ           = 6;
	DT_RF_MRZ_DATA      = 7;
	DT_RF_RESULT        = 8;
	DT_BARCODE_CNT      = 9;
	DT_BARCODE_DATA     = 10;
	DT_CREW_DATA        = 11;
	DT_CERT_DS          = 12; // 0
	DT_CERT_CSCA        = 13; // 1
	DT_CERT_CRL         = 14; // 2

	DEFAULT_READ_MODE = SM_WH + SM_IR;
	FULL_READ_MODE    = DEFAULT_READ_MODE + SM_UV + SM_RFCARD;

// CERT
  ABC_PS_CERT_DS      = 0;
  ABC_PS_CERT_CSCA    = 1;
  ABC_PS_CERT_CRL     = 2;

  MAX_DN_LEN              = 200+1;
  MAX_SERIAL_LEN          = 20;
  MAX_ALGDESC_DATESTR_LEN = 50;
  MAX_RDN_SIGNATURE_LEN   = 1024;
  MAX_KEYID_LEN           = 80;
  MAX_KUDESC_LEN          = 200;
  MAX_FILEPATH_LEN        = 256;

type
	// ABC_PS Message : WPARAM 정의
	PS_DEV_MSSG_WPARAM_DEFINE = (
    WP_PS_ERROR,  // 0
    WP_PS_OPEN,   // 1
    WP_PS_CLOSE,  // 2
    WP_PS_START_AUTO, // 3
    WP_PS_STOP_AUTO,  // 4
    WP_PS_PASSPORT_READ_BEGIN,   // 5
    WP_PS_PASSPORT_READ_END,     // 6
    WP_PS_E_PASSPORT_READ_BEGIN, // 7
    WP_PS_E_PASSPORT_READ_END,   // 8
    WP_PS_DOCUMENT_ON,           // 9
    WP_PS_DOCUMENT_OFF,          // 10
    WP_PS_DOCUMENT_MOVING,       // 11
    WP_PS_DOCUMENT_NOTREMOVED,   // 12
    WP_PS_E_PASSPORT_ON,         // 13
    WP_PS_BARCODE_READ_BEGIN,    // 14
    WP_PS_BARCODE_READ_END,
    WP_PS_RFCARD_ON,
    WP_PS_RFCARD_READ_BEGIN,
    WP_PS_RFCARD_READ_END,
    WP_PS_BAC,
    WP_PS_AA,
    WP_PS_PA,
    WP_PS_TA,
    WP_PS_READ_EFCOM,
    WP_PS_READ_SOC,
    WP_PS_READ_DGx,
    WP_PS_VIZ_COMPLETE
	);

  RF_DEV_MSSG_WPARAM_DEFINE = (
    WM_RF_CREW_CARD_ON,                    // 승무원카드 인식 시작
    WM_RF_CREW_CARD_COMPLETE,            // 승무원카드 인식 완료
    WM_RF_CARD_WRITE_COMPLETE,            // 승무원카드 Write 완료
    WM_RF_CARD_WRITE_FAIL,                // 승무원카드 Write 실패
    WM_RF_TIMEOUT                        // 자동 인식 모드 타임아웃 발생
  );

	ABC_PS_MRZ = packed record
		mrz1 : Array[0..MAX_MRZ_LINE_SIZE-1] of AnsiChar;
		mrz2 : Array[0..MAX_MRZ_LINE_SIZE-1] of AnsiChar;
		mrz3 : Array[0..MAX_MRZ_LINE_SIZE-1] of AnsiChar;
	end;
	PABC_PS_MRZ = ^ABC_PS_MRZ;

	ABC_PS_MRZ_DATA = packed record
		raw_mrz			    : ABC_PS_MRZ;
		DocType			    : Array[0..1] of AnsiChar;
		IssuingState	  : Array[0..2] of AnsiChar;
		Name			      : Array[0..38] of AnsiChar;
		PassportNum		  : Array[0..8] of AnsiChar;
		PassportNumCD	  : AnsiChar;
		PassportNumCDR	: AnsiChar;
		Nationality		  : Array[0..2] of AnsiChar;
		Birth			      : Array[0..5] of AnsiChar;
		BirthCD			    : AnsiChar;
		BirthCDR		    : AnsiChar;
		Sex				      : AnsiChar;
		Expiry			    : Array[0..5] of AnsiChar;
		ExpiryCD		    : AnsiChar;
		ExpiryCDR		    : AnsiChar;
		Optional		    : Array[0..14] of AnsiChar;
		OptionalCD		  : AnsiChar;
		OptionalCDR		  : AnsiChar;
		CompositeCD		  : AnsiChar;
		CompositeCDR	  : AnsiChar;
	end;
	PABC_PS_MRZ_DATA = ^ABC_PS_MRZ_DATA;

	ABC_PS_E_DOC_ENV = packed record
		bAA		: Integer;
		bCA		: Integer;
		bPA		: Integer;
		bTA		: Integer;
		bDGx	: Array[0..15] of Integer;
	end;
	PABC_PS_E_DOC_ENV = ^ABC_PS_E_DOC_ENV;

	ABC_PS_RF_CARD_ENV = packed record
		bDGx	: Array[0..15] of Integer;
		iType	: Integer;
	end;
	PABC_PS_RF_CARD_ENV = ^ABC_PS_RF_CARD_ENV;

	ABC_PS_E_DOC_DATA = packed record
		Result	: Integer;
		bBAC	  : Integer;
		bAA		  : Integer;
		bCA		  : Integer;
		bPA		  : Integer;
		bTA		  : Integer;
		bDGx	  : Array[0..15] of Integer;
	end;
	PABC_PS_E_DOC_DATA = ^ABC_PS_E_DOC_DATA;

	ABC_PS_RF_CARD_DATA = packed record
		bResult		: Integer;
		bDGx		  : Array[0..15] of Integer;
	end;
	PABC_PS_RF_CARD_DATA = ^ABC_PS_RF_CARD_DATA;

  ABC_PS_CREW_DATA = packed record
    RegNum        : Array[0..255] of AnsiChar;
    RegDay        : Array[0..255] of AnsiChar;
    Nationality   : Array[0..255] of AnsiChar;
    KoreanName    : Array[0..255] of AnsiChar;
    PersonNum     : Array[0..255] of AnsiChar;
    EnglishName   : Array[0..255] of AnsiChar;
    Sex           : Array[0..255] of AnsiChar;
    BirthDay      : Array[0..255] of AnsiChar;
    IssuDay       : Array[0..255] of AnsiChar;
    ExpiryDay     : Array[0..255] of AnsiChar;
    Respons       : Array[0..255] of AnsiChar;
    Company       : Array[0..255] of AnsiChar;
    PassNum       : Array[0..255] of AnsiChar;
    PassIssuDay   : Array[0..255] of AnsiChar;
    PassExpiryDay : Array[0..255] of AnsiChar;
  end;
  PABC_PS_CREW_DATA = ^ABC_PS_CREW_DATA;

	ABC_PS_BARCODE_DATA = packed record
		iBarcodeType	: Integer;
		iLeft			    : Integer;
		iRight			  : Integer;
		iTop			    : Integer;
		iBottom			  : Integer;
		iDataLen		  : Integer;
		BarcodeData		: Array[0..MAX_BACODE_DATA_SIZE-1] of Byte;
	end;
	PABC_PS_BARCODE_DATA = ^ABC_PS_BARCODE_DATA;

  ABC_PS_CERT_INFO = packed record
    dwVersion           : DWORD;
    dwSerial            : DWORD;
    strSerial           : Array[0..MAX_SERIAL_LEN*2] of AnsiChar;
    strSignatureAlgDesc : Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
    strIssuerRDN        : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
    strFrom             : Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
    strTo               : Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
    strSubjectRDN       : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
    strSubjectKeyAlgDesc: Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
    strSubjectPublickey : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
    dwPubKeyLen         : DWORD;
    strSignature        : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
  	strAuthorityKeyID   : Array[0..MAX_KEYID_LEN - 1] of AnsiChar;
  	strSubjectKeyID     : Array[0..MAX_KEYID_LEN - 1] of AnsiChar;
  	strKeyUsageDesc     : Array[0..MAX_KUDESC_LEN - 1] of AnsiChar;
  	dwKeyUsage          : DWORD;
  	strPrivateKeyUsagePeriodFrom  : Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
  	strPrivateKeyUsagePeriodTo    : Array[0..MAX_ALGDESC_DATESTR_LEN - 1] of AnsiChar;
  	dwPolicyNum         : DWORD;
  	strPolicyID         : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
    strBasicConstraints : Array[0..MAX_KEYID_LEN - 1] of AnsiChar;
    strCrlDistributionPoints      : Array[0..MAX_RDN_SIGNATURE_LEN - 1] of AnsiChar;
  end;
  PABC_PS_CERT_INFO = ^ABC_PS_CERT_INFO;

  ABC_RP_VIZ_WORD_DATA = packed record
    iTop : Integer;
    iBottom : Integer;
    iLeft : Integer;
    iRight : Integer;
    strWordInfo : array[0..128-1] of Char;
    iCharacterLen : Integer;
    strRecData : array[0..128-1] of Char;
  end;

  ABC_RP_VIZ_DATA = packed record
    iTempleateNo : Integer;
    iTempleateType : Integer;
    strTempleateInfo : array[0..128-1] of Char;
    iWordCnt : Integer;
    sRP_VIZ_Word_Data : array[0..16-1] of ABC_RP_VIZ_WORD_DATA;
  end;
  PABC_RP_VIZ_DATA = ^ABC_RP_VIZ_DATA;

	// define typedef
	READ_DOC_MODE		    = Integer;
	READ_METHOD			    = Integer;
	PASSPORT_IMAGE_TYPE = Integer;
	DOCUMENT_TYPE		    = Integer;
	BARCODE_TYPE		    = Integer;
	RFCARD_TYPE			    = Integer;
	DATA_TYPE			      = Integer;


function PPR_InitPassportSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_UnInitPassportSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_Passport_RegisterMessageHandle( context : ABC_Context; hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_Passport_ReadDocument( context : ABC_Context; iReadMethod : READ_METHOD = READ_MANUAL; bNewDocCheck : Boolean = true; iReadMode : READ_DOC_MODE = FULL_READ_MODE; bPreview : Boolean = false ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_Passport_DocumentStop( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_InitSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_RegisterDeviceStatusCallback( callback : ABC_DeviceStatusCallback; pParent : Pointer ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_GetDeviceCount( bRefresh : Integer; iDeviceCount : PInteger ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_GetDeviceSource( info : PABC_DEVICE_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_GetLastError( context : ABC_Context) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_ErrorToDescription( context : ABC_Context; iErrCode : Integer ) : PAnsiChar; stdcall
	external 'ABC_Device.dll';

function PPR_CreateContext( pContext : PABC_Context; devicesource : PAnsiChar ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_DestroyContext( context : PABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_DeviceOpen( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_DeviceClose( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

function PPR_RegisterPreviewCallback( context : ABC_Context; callback : ABC_PreviewCallback; pParent : Pointer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_UnregisterPreviewCallback( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_RegisterMessageHandle( context : ABC_Context; hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_UnregisterMessageHandle( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Read Document
function PPR_ReadDocument( context : ABC_Context; iReadMethod : READ_METHOD = READ_MANUAL; bNewDocCheck : Boolean = true; iReadMode : READ_DOC_MODE = FULL_READ_MODE; bPreview : Boolean = false ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_ReadDocumentStop( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Read E-Passport
function PPR_SetEDocEnv( context : ABC_Context; env : ABC_PS_E_DOC_ENV ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_GetEDocEnv( context : ABC_Context; env : PABC_PS_E_DOC_ENV ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_ReadEDocument( context : ABC_Context; mrz : PABC_PS_MRZ ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Read barcode
function PPR_ReadBarcode( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Read RF-Card
function PPR_SetRFCardEnv( context : ABC_Context; env : ABC_PS_RF_CARD_ENV ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_GetRFCardEnv( context : ABC_Context; env : PABC_PS_RF_CARD_ENV ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_ReadRFCard( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// only scan
function PPR_ScanDocument( context : ABC_Context; iReadMode : READ_DOC_MODE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_StartPreview( context : ABC_Context; bLight : Boolean = false ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_StopPreview( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Get image and data
function PPR_GetImage( context : ABC_Context; iImageType : PASSPORT_IMAGE_TYPE; image : PABC_IMAGE ) : Integer; stdcall;
	external 'ABC_Device.dll';
function PPR_GetData( context : ABC_Context; iDataType : DATA_TYPE; data : Pointer; iIfBarcodeIndex : Integer = 0 ) : Integer; stdcall;
	external 'ABC_Device.dll';

// Free buffers
procedure PPR_FreeImage( image : PABC_IMAGE ); stdcall;
	external 'ABC_Device.dll';

// cert
function PPR_GetCERTInfo( context : ABC_Context; iCertType : Integer; cert_info : PABC_PS_CERT_INFO ) : Integer; stdcall;
  external 'ABC_Device.dll';

// VIZ Data
function PPR_GetVizResult(viz_data : PABC_RP_VIZ_DATA) : Integer; stdcall;
  external 'ABC_Device.dll';

// Duali RF Card Reader
function RFC_InitSDK : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_UnInitSDK : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_RegisterMessageHandle(hWnd : HWND) : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_Read : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_ReadStop : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_GetData(data : PABC_PS_CREW_DATA) : Integer; stdcall;
  external 'ABC_Device.dll';
function RFC_WriteCard(data : ABC_PS_CREW_DATA) : Integer; stdcall;
  external 'ABC_Device.dll';

implementation

end.


