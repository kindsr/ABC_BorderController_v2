{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit ABC_DC_DM;

interface

uses
	Messages, Windows, uConst;

const
  WM_DC_DEVICE            = (WM_USER+400);
	WM_LIGHT_DEVICE         = (WM_USER+12001);

  // Door Position
  DCU_DOOR_POS_ALL        = 0;
  DCU_DOOR_POS_FRONT      = 1;
  DCU_DOOR_POS_REAR       = 2;

  // Door Command
  DCU_DOOR_COMMAND_RESET  = 0;                      // 초기화
  DCU_DOOR_COMMAND_OPEN_A = 1;                      // 열기(입장)
  DCU_DOOR_COMMAND_CLOSE  = 2;                      // 닫기
  DCU_DOOR_COMMAND_OPEN_B = 3;                      // 열기(퇴장)

  DOORPositions : array[0..2] of string =
  (
    'DCU_DOOR_POS_ALL',
    'DCU_DOOR_POS_FRONT',
    'DCU_DOOR_POS_REAR'
  );

  DOORCommands : array[0..3] of string =
  (
    'DCU_DOOR_COMMAND_RESET',
    'DCU_DOOR_COMMAND_OPEN_A',
    'DCU_DOOR_COMMAND_CLOSE',
    'DCU_DOOR_COMMAND_OPEN_B'
  );

  // LED Position
  DCU_LED_INDICATOR       = 0;
  DCU_LED_PASSPORT        = 1;
  DCU_LED_FINGERPRINT     = 2;
  DCU_LED_PRINTER         = 3;
  DCU_LED_TOPWARNING      = 4;
  DCU_LED_TOPPROCESS      = 5;

  // LED Color
  DCU_LED_OFF             = 0;
  DCU_LED_RED             = 1;
  DCU_LED_GREEN           = 2;
  DCU_LED_BLUE            = 3;
  DCU_LED_GREEN_OFF       = 3;

  LEDPositions : array[0..5] of string =
  (
    'DCU_LED_INDICATOR',
    'DCU_LED_PASSPORT',
    'DCU_LED_FINGERPRINT',
    'DCU_LED_PRINTER',
    'DCU_LED_TOPWARNING',
    'DCU_LED_TOPPROCESS'
  ) ;
  LEDColors : array[0..3] of string =
  (
    'DCU_LED_OFF',
    'DCU_LED_RED',
    'DCU_LED_GREEN',
    'DCU_LED_BLUE'
  );

type
  ABC_DCU_DEVICE_STATUS = packed record
	  devLEDRed               :integer;		                	//		//;3색경광등(Red)		  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_bRedLamp
	  devLEDGreen             :integer;		                	//		//;3색경광등(Green)	  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_bGreenLamp
	  devLEDYellow            :integer;		                	//		//;3색경광등(Yellow)  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_bYellowLamp
	  devFlashTop             :integer;                     //		//;플래시 상				  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_bTopFlash
	  devCameraLEDTop         :integer;                     //		//;카메라 유도등 상	  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_ledBright
	  devCamera               :integer;                     //		//;안면카메라			    ;대기 : 0, 사용 : 1, 오류 : 2이상 장비별	; 장비체크
	  devCameraLEDBottom      :integer;                     //		//;카메라 유도등 하		;꺼짐 : 0, 켜짐 : 1					              ; m_ledBright
	  devFlashBottom          :integer;                     //		//;플래시 하				  ;꺼짐 : 0, 켜짐 : 1					              ; 7. m_bBottomFlash
	  devGCUDoorRear          :integer;                     //		//;출구도어				    ;닫힘 : 0, 열림 : 1, 오류 : 2		          ; 5. 6. m_door
	  devFingerLED            :integer;                     //		//;지문인식 유도등		;꺼짐 : 0, 켜짐 : 1					              ; 5. m_bFingerGuideLamp
	  devFingerDevice         :integer;                     //		//;지문인식기		      ;대기 : 0, 사용 : 1, 오류 : 2		          ; 장비체크
	  devSensorRear           :integer;                     // X	//;프린터 용지 센서		;용지 여유 : 0, 용지부족: 1			          ;
	  devGCUDoorFront         :integer;                     //		//;입구도어				    ;닫힘 : 0, 열림 : 1, 오류 : 2		          ; 1. 2. m_door
	  devMRP                  :integer;                     //		//;여권판독기			    ;대기 : 0, 사용 : 1, 오류 : 2		          ; 장비체크
	  devEntryLED             :integer;                     // X	//;입장 유도등 		    ;꺼짐 : 0, 켜짐 : 1				                ;
	  devIndicatorLED         :integer;                     //		//;진입LED(↙ or X )	;X : 0, ↙ : 1 						                ; 1. m_bFrontIndicator
	  devProximitySensorFront :integer;                     // X	//;전면 접근센서			;꺼짐 : 0, 켜짐 : 1					;
	  devRFCard               :integer;                     // X	//;승무원카드리더기		;감지없음 : 0, 감지 : 1, 오류 : 2	;
	  devSubBoard1            :integer;		                	//		서브보드1				      ;오류 : 1, 정상 : 0
	  devSubBoard2            :integer;		                	//		서브보드2				      ;오류 : 1, 정상 : 0
	  devSubBoard3            :integer;		                	//		서브보드3				      ;오류 : 1, 정상 : 0
	  devSubBoard4            :integer;		                	//		서브보드4				      ;오류 : 1, 정상 : 0
	  devSubBoard5            :integer;		                	//		서브보드5				      ;오류 : 1, 정상 : 0
	  devSubBoard6            :integer;		                	//		서브보드6				      ;오류 : 1, 정상 : 0
	  devSubBoard7            :integer;		                	//		서브보드7				      ;오류 : 1, 정상 : 0
	  devSenser               :Array [0..99] of BYTE;		 		//    센서상태				      ;작동 : 0, 감지 : 1, 오류 : 2		          ; m_sensor
  end;
  PABC_DCU_DEVICE_STATUS = ^ABC_DCU_DEVICE_STATUS;

  ABC_ST_BRIGHTNESS = packed record
    iBrightness : Integer;
  end;
  PABC_ST_BRIGHTNESS = ^ABC_ST_BRIGHTNESS;

  DC_DOOR_POSITION   = Integer;  // door 위치
  DC_DOOR_COMMAND    = Integer;  // door 명령
  DC_LED_POSITION    = Integer;  // LED 위치
  DC_LED_COMMAND     = Integer;  // LED 명령

  PDC_DOOR_POSITION   = ^DC_DOOR_POSITION;
  PDC_DOOR_COMMAND    = ^DC_DOOR_COMMAND;
  PDC_LED_POSITION    = ^DC_LED_POSITION;
  PDC_LED_COMMAND     = ^DC_LED_COMMAND;

// Message : WPARAM 정의
  DCU_DEV_MSG_WPARAM_DEFINE = (
    WP_DC_ERROR,            // 0
    WP_DC_OPEN,             // 1
    WP_DC_CLOSE,            // 2
    WP_DC_ALIVE,            // 3
    WP_DC_ALERT,            // 4
    WP_DC_SENSOR_ALERT,     // 5
    WP_DC_OPERATION,        // 6
    WP_DC_ST_GCU,           // 7
    WP_DC_ST_SENSOR,        // 8
    WP_DC_ENTRY_ALRAM,      // 9
    WP_DC_A_ENT_CLOSE,      // 10
    WP_DC_A_NOENT_CLOSE,    // 11
    WP_DC_B_ENT_CLOSE,      // 12
    WP_DC_B_NOENT_CLOSE,    // 13
    WP_DC_A_EXT_CLOSE,      // 14
    WP_DC_A_NOEXT_CLOSE,    // 15
    WP_DC_B_EXT_CLOSE,      // 16
    WP_DC_B_NOEXT_CLOSE,    // 17
    WP_DC_REMOTE_CLOSE2,      // 18
    WP_DC_REMOTE_NULL,
    WP_DC_REMOTE_CLOSE
  );


{Door}
function DCU_InitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_UnInitSDK : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_GetDeviceSource( info : PABC_DEVICE_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_GetLastError(context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_ErrorToDescription( context : ABC_Context; iErrCode : Integer ) : PAnsiChar; stdcall;
  external 'ABC_Device.dll';
function DCU_DeviceOpen( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_DeviceClose( context : ABC_Context ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_RegisterMessageHandle( context : ABC_Context; hWnd : HWND; iMessage : Integer ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_DoorControl( context : ABC_Context; iDoor : DC_DOOR_POSITION; iCmd : DC_DOOR_COMMAND; iAutoCloseTime : Integer = 0 ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_LEDControl( context : ABC_Context; iLED : DC_LED_POSITION; iCmd : DC_LED_COMMAND ) : Integer; stdcall;
	external 'ABC_Device.dll';
function DCU_GetCheckedSensorInfo(szInfo : PAnsiChar) : Integer;  stdcall;
  external 'ABC_Device.dll';

{Lights}
function DIM_InitSDK : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_Setconfig(iPort : Integer) : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_Handle(hWnd : HWND) : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_Connect : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_SetBrightness(iBrightness : Integer) : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_DisConnect : Integer; stdcall;
  external 'ABC_Device.dll';
function DIM_GetIlluminance : Integer; stdcall;
  external 'ABC_Device.dll';

{Device Status}
function MNT_InitSDK : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_UnInitSDK : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_GetDeviceSource( info : PABC_DEVICE_INFO ) : Integer; stdcall;
	external 'ABC_Device.dll';

function MNT_CreateContext(context : ABC_Context; devicesource : PAnsiChar ) : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_DestroyContext(context : ABC_Context  ) : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_GetDeviceInfoStruct(context : ABC_Context; devSTATUS: PABC_DCU_DEVICE_STATUS  ) : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_SetFDoorAlarmLongTime( context : ABC_Context; iSensorAlarmTime :integer ) : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_SetRDoorAlarmLongTime( context : ABC_Context; iSensorAlarmTime :integer ) : Integer; stdcall;
  external 'ABC_Device.dll';
function MNT_SetLostPeopleAlarmTime( context : ABC_Context; iLostPeopleAlarmTime :integer ) : Integer; stdcall;
  external 'ABC_Device.dll';

implementation

end.


