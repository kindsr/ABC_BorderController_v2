{*******************************************************}
{                                                       }
{                BorderContrroller                      }
{                                                       }
{           Copyright (C) 2017 G-An Tech                }
{                                                       }
{   Copyright and license exceptions noted in source    }
{                                                       }
{*******************************************************}

unit uHTTP;

interface

uses
  Windows, SysUtils, HTTPApp, IdHTTP, XMLDoc, XMLIntf, ActiveX, Classes, Dialogs,
  System.Net.URLClient, System.Generics.Collections, Soap.EncdDecd, Forms,
  IdMultipartFormData, SHDocVw, jpeg;

const
  SERVER_ADDRESS = 'http://192.168.3.142:8050'; // 개발서

{Database Return Message}
const
  MSG_DATA_EXIST = '등록된 데이터가 있습니다.';

const
  // Select
	ABC00000 = '조회';
	ABC00001 = '정상적으로 조회 되었습니다.';
	ABC00002 = '조회된 데이터가 없습니다.';

  // Save
	ABC01000 = '저장';
	ABC01001 = '정상적으로 저장 되었습니다.';
	ABC01002 = '저장에 실패하였습니다.';
	ABC01003 = '저장된 데이터가 있습니다.';

  // Modify
  ABC02000 = '수정';
  ABC02001 = '정상적으로 수정되었습니다.';
  ABC02002 = '수정에 실패하였습니다.';

  // Delete
  ABC03000 = '삭제';
  ABC03001 = '정상적으로 삭제되었습니다.';
  ABC03002 = '삭제에 실패하였습니다.';

  // Mrp Msg
  ABC10000 = 'MRP 판독';
  ABC10001 = '정상적으로  판독되었습니다.';
  ABC10002 = 'MRP 판독에 실패하였습니다.';
  ABC10003 = '규제자입니다.';
  ABC10004 = '농축산관계자입니다.';

  RES_CD_LIST : array[1..18] of string = (
    ABC00000,
    ABC00001,
    ABC00002,
    ABC01000,
    ABC01001,
    ABC01002,
    ABC01003,
    ABC02000,
    ABC02001,
    ABC02002,
    ABC03000,
    ABC03001,
    ABC03002,
    ABC10000,
    ABC10001,
    ABC10002,
    ABC10003,
    ABC10004
  );

function HTTPGet(ServerAddress, sPage, sParam : string) : string; overload;
function HTTPGet(ServerAddress, sPage : string; slParam : TStringList) : IXMLDocument; overload;
function HTTPGet(ServerAddress: string; var AStream: TMemoryStream) : Int64; overload;
function HTTPGet(ServerAddress: string) : string; overload;
function HTTPBlob(ServerAddress, sPage, sParam : string) : string;
function HTTPJson(ServerAddress, sPage : string; ReqJson : TStringStream) : string; overload;
function HTTPJson(ServerAddress, sPage : string; ReqJson : string) : string; overload;
function HTTPUploadFile(ServerAddress, sPage : string; ReqJson : string) : string; overload;
function HTTPUploadFile(ServerAddress : string; ReqStream : TIdMultiPartFormDataStream) : string; overload;

implementation

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPGet                                                        //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: ServerAddress, sPage, sParam : string                          //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPGet(ServerAddress, sPage, sParam : string) : string;
var
  HTTP: TIdHTTP;
  Query: String;
  Buffer: String;
  Doc: IXMLDocument;
  Node: IXMLNode;
begin
  Result := '';
  try
    HTTP := TIdHTTP.Create;

    // Build query
    // For more information, see http://www.mediawiki.org/wiki/API:Query
    Query := ServerAddress + sPage + '?' + sParam;

    // HTTP GET request
    Buffer := HTTP.Get(Query);

    // Create XML document
    Doc := TXMLDocument.Create(nil);

    // Build XML document from HTTP response
    Doc.LoadFromXML(Buffer);

    // Display document content
//    Writeln(Doc.XML.Text);
    Result := Doc.XML.Text;

    // Get main node
    Node := Doc.ChildNodes.FindNode('resultFingerSpecData');

    // Process XML data
    // ...
    Result := Node.ChildNodes.FindNode('gid').Text;

    HTTP.Destroy;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPGet                                                        //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: ServerAddress, sPage : string; slParam : TStringList           //
//  Result:    IXMLDocument                                                   //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPGet(ServerAddress, sPage : string; slParam : TStringList) : IXMLDocument;
var
  HTTP: TIdHTTP;
  Query: String;
  Buffer: String;
  Doc: IXMLDocument;
  Node: IXMLNode;
  i : Integer;
begin
  Result := nil;
  try
    HTTP := TIdHTTP.Create;

    // Build query
    // For more information, see http://www.mediawiki.org/wiki/API:Query
//    Query := ServerAddress + '/w' + '/api.php?' +
//      'action=query&prop=revisions&rvprop=content&format=xml&titles=' +
//      String(HTTPEncode('Main Page'));
//    Query := 'http://192.168.3.28:8080/map/info.xml?gid=1&content=Result&title=Marshalling';
    Query := ServerAddress + sPage + '?';

    for i := 0 to slParam.Count - 1 do
    begin
      Query := Query + slParam[i];
      if (i < slParam.Count - 1) then Query := Query + '&';
    end;

    // HTTP GET request
    Buffer := HTTP.Get(Query);

    // Create XML document
    Doc := TXMLDocument.Create(nil);

    // Build XML document from HTTP response
    Doc.LoadFromXML(Buffer);

    // Display document content
//    Writeln(Doc.XML.Text);
    Result := Doc;

    HTTP.Destroy;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

function HTTPGet(ServerAddress: string; var AStream: TMemoryStream) : Int64;
var
  HTTP: TIdHTTP;
//  jpg: TJPEGImage;
  Stream: TMemoryStream;
begin
  Result := -1;

  Stream := TMemoryStream.Create;
  try
//    jpg := TJPEGImage.Create;
    try
      HTTP := TIdHTTP.Create;
      Stream.Clear;
      try
        HTTP.Get(ServerAddress, Stream);
        HTTP.Destroy;
      except
        on E: Exception do
          Writeln(E.ClassName, ': ', E.Message);
      end;
      Stream.Position := 0;
      AStream.Clear;
      AStream.CopyFrom(Stream, Stream.Size);
      Result := AStream.Size;
//      jpg.LoadFromStream(Stream);

    finally
//      jpg.Free;
    end;
  finally
    Stream.Free;
  end;
end;

function HTTPGet(ServerAddress: string) : string;
var
  HTTP: TIdHTTP;
begin
  Result := '';

  HTTP := TIdHTTP.Create;
  try
    Result := HTTP.Get(ServerAddress);
    HTTP.Destroy;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPBlob                                                       //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: ServerAddress, sPage, sParam : string                          //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPBlob(ServerAddress, sPage, sParam : string) : string;
var
  HTTP: TIdHTTP;
  Query: String;
  Buffer: String;
  Doc: IXMLDocument;
  Node: IXMLNode;
begin
  Result := '';
  try
    HTTP := TIdHTTP.Create;

    // Build query
    // For more information, see http://www.mediawiki.org/wiki/API:Query
//    Query := 'http://192.168.3.28:8080/mrp/passno.xml?PassNo=M32782095';
    Query := SERVER_ADDRESS + '/face/regno.xml?RegNo=KORGAN1700000001';

    // HTTP GET request
    Buffer := HTTP.Get(Query);

    // Create XML document
    Doc := TXMLDocument.Create(nil);

    // Build XML document from HTTP response
    Doc.LoadFromXML(Buffer);

    // Display document content
//    Writeln(Doc.XML.Text);
//    Result := Doc.XML.Text;

    // Get main node
    Node := Doc.ChildNodes.FindNode('SelectFaceImg');

    // Process XML data
    // ...
    Result := Node.ChildNodes.FindNode('faceImg').Text;

    HTTP.Destroy;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPJson                                                       //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: ServerAddress, sPage : string; ReqJson : TStringStream         //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPJson(ServerAddress, sPage : string; ReqJson : TStringStream) : string;
var
  HTTP: TIdHTTP;
begin
  Result := '';

  HTTP := TIdHTTP.Create;
  HTTP.HandleRedirects := True;
  HTTP.Request.Accept := 'application/json';
  HTTP.Request.ContentType := 'application/json';

  // HTTP POST request
  Result := HTTP.Post(ServerAddress + sPage, ReqJson);

  HTTP.Destroy;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPJson                                                       //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2017.08.25                                                     //
//  Arguments: ServerAddress, sPage : string; ReqJson : string                //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPJson(ServerAddress, sPage : string; ReqJson : string) : string;
var
  HTTP: TIdHTTP;
begin
  Result := '';

  HTTP := TIdHTTP.Create;
  HTTP.HandleRedirects := True;
  HTTP.Request.ContentType := 'application/json';
  HTTP.Request.ContentEncoding := 'UTF-8';

  // HTTP POST request
  Result := HTTP.Post(ServerAddress + sPage, ReqJson);

  HTTP.Destroy;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Procedure: HTTPUploadFile                                                 //
//  Author:    Seungryong Kim @ G-An Tech                                     //
//  DateTime:  2018.10.10                                                     //
//  Arguments: ServerAddress, sPage : string; ReqJson : string                //
//  Result:    string                                                         //
//  Purpose:                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function HTTPUploadFile(ServerAddress, sPage : string; ReqJson : string) : string;
var
  HTTP: TIdHTTP;
  PostStream: TIdMultiPartFormDataStream;
  ResponseStream: TMemoryStream;
begin
  Result := '';

  HTTP := TIdHTTP.Create;
  PostStream := TIdMultiPartFormDataStream.Create;
  ResponseStream := TMemoryStream.Create;

  try
    HTTP.Request.ContentType := PostStream.RequestContentType;
    PostStream.AddFile('file',ReqJson,sContentTypeFormData);
    Result := HTTP.Post(ServerAddress, PostStream);
  finally
    PostStream.Free;
    ResponseStream.Free;
    HTTP.Destroy;
  end;
end;

function HTTPUploadFile(ServerAddress : string; ReqStream : TIdMultiPartFormDataStream) : string;
var
  HTTP: TIdHTTP;
begin
  Result := '';
  HTTP := TIdHTTP.Create;

  try
    HTTP.Request.ContentType := ReqStream.RequestContentType;
    Result := HTTP.Post(ServerAddress, ReqStream);
  finally
    HTTP.Destroy;
  end;
end;

end.
