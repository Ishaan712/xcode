unit projutils;

{
  Functions for fixing up Xcode project files (for example, after duplicating
   an existing project).

  Author:    Phil Hess.
  Copyright: Copyright (C) Phil Hess.
  License:   Modified LGPL (see Free Pascal's rtl/COPYING.FPC).
}

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ENDIF}

interface

uses
  SysUtils,
  Classes;

function FixupPbxprojFile(const OldPbxFName : string;
                          const NewPbxFName : string;
                          const OldProjName : string;
                          const NewProjName : string;
                          const NewOrgName  : string;
                            var ErrorMsg    : string) : Boolean;

function FixupXmlFile(const OldXmlFName : string;
                      const NewXmlFName : string;
                      const OldProjName : string;
                      const NewProjName : string;
                        var ErrorMsg    : string) : Boolean;


implementation

function GetPbxUuid : string;
 {Return a 24-hex digit UUID as used in Xcode .pbxproj files.}
const
  MaxPlus1 : Int64 = $100000000;
var
  Part1    : LongWord;
  Part2    : LongWord;
  Part3    : LongWord;
begin
  Part1 := Random(MaxPlus1);
  Part2 := Random(MaxPlus1);
  Part3 := Random(MaxPlus1);
  Result := IntToHex(Part1, 8) + IntToHex(Part2, 8) + IntToHex(Part3, 8);
end;


function IncPbxUuid(const Uuid : string) : string;
 {Increment the first 8 digits of UUID the way Xcode does.}
var
  Part1    : string;
  Part1Val : LongWord;
begin
  Part1 := Copy(Uuid, 1, 8);
  Part1Val := StrToInt64('$' + Part1);  //assume valid UUID was passed
  if Part1Val = $ffffffff then
    Part1Val := 0;
  Result := IntToHex(Part1Val+1, 8) + Copy(Uuid, 9, MaxInt); 
end;


function IsPbxUuid(const CandUuiD : string) : Boolean;
 {Return True if string is valid 24-hex digit UUID.}
var
  Part1   : string;
  Part2   : string;
  Part3   : string;
  PartVal : Int64;
begin
  Result := False;
  if Length(CandUuiD) <> 24 then
    Exit;
  Part1 := Copy(CandUuid, 1, 8);
  Part2 := Copy(CandUuid, 9, 8);
  Part3 := Copy(CandUuid, 17, 8);
  if TryStrToInt64('$' + Part1, PartVal) and
     TryStrToInt64('$' + Part2, PartVal) and
     TryStrToInt64('$' + Part3, PartVal) then
    Result := True;
end;


function FixupPbxprojFile(const OldPbxFName : string;
                          const NewPbxFName : string;
                          const OldProjName : string;
                          const NewProjName : string;
                          const NewOrgName  : string;
                            var ErrorMsg    : string) : Boolean;
 {Replace .pbxproj file's UUID's with new UUID's.
   Also replace file's project name with new project name
   and file's organization name with new organization name.}
var
  OldPbxF    : TextFile;
  NewPbxF    : TextFile;
  UUID       : string;
  SubUUID    : TStringList;
  InStr      : string;
  TrimInStr  : string;
  SpacePos   : Integer;
  CandUUID   : string;
  SubUuidIdx : Integer;
begin
  Result := False;
  AssignFile(OldPbxF, OldPbxFName);
  try
    Reset(OldPbxF);
  except
    on EInOutError do
      begin
      ErrorMsg := 'Error: Can''t open file ' + OldPbxFName;
      Exit;
      end;
    end;

  AssignFile(NewPbxF, NewPbxFName);
  try
    Rewrite(NewPbxF);
  except
    on EInOutError do
      begin
      ErrorMsg := 'Error: Can''t create file ' + NewPbxFName;
      Exit;
      end;
    end;

  UUID := GetPbxUuid;
  SubUUID := TStringList.Create;
  try
    while not Eof(OldPbxF) do
      begin
      ReadLn(OldPbxF, InStr);
      TrimInStr := Trim(InStr);  {Trim tabs and spaces}
      if Copy(TrimInStr, Length(TrimInStr), 1) = ';' then
        TrimInStr := Copy(TrimInStr, 1, Length(TrimInStr)-1);
      while TrimInStr <> '' do
        begin
        SpacePos := Pos(' ', TrimInStr);
        if SpacePos = 0 then
          SpacePos := Length(TrimInStr) + 1;
        CandUUID := Copy(TrimInStr, 1, SpacePos-1);
        TrimInStr := Trim(Copy(TrimInStr, SpacePos+1, MaxInt));
        if IsPbxUuid(CandUUID) then
          begin
          SubUuidIdx := SubUUID.IndexOfName(CandUUID);
          if SubUuidIdx < 0 then  {Not previously encountered?}
            begin
            SubUuidIdx := SubUUID.Add(CandUUID + '=' + UUID);
            UUID := IncPbxUuid(UUID);
            end;
          InStr := StringReplace(InStr, CandUUID, 
                    SubUUID.ValueFromIndex[SubUuidIdx], [rfReplaceAll]);
          end;
        end;
      InStr := StringReplace(InStr, OldProjName, NewProjName, [rfReplaceAll]);
      if (Pos('ORGANIZATIONNAME', InStr) > 0) and (NewOrgName <> '') then
        InStr := Copy(InStr, 1, Pos('ORGANIZATIONNAME', InStr)+15) + 
                 ' = ' + NewOrgName + ';';
      WriteLn(NewPbxF, InStr);
      end;
    Result := True;
  finally
    CloseFile(OldPbxF);
    CloseFile(NewPbxF);
    SubUUID.Free;
  end;
end;


function FixupXmlFile(const OldXmlFName : string;
                      const NewXmlFName : string;
                      const OldProjName : string;
                      const NewProjName : string;
                        var ErrorMsg    : string) : Boolean;
 {Replace .storyboard or .xcworkspacedata file's project name with 
   new project name.}
var
  OldXmlF : TextFile;
  NewXmlF : TextFile;
  InStr   : string;
begin
  Result := False;
  AssignFile(OldXmlF, OldXmlFName);
  try
    Reset(OldXmlF);
  except
    on EInOutError do
      begin
      ErrorMsg := 'Error: Can''t open file ' + OldXmlFName;
      Exit;
      end;
    end;

  AssignFile(NewXmlF, NewXmlFName);
  try
    Rewrite(NewXmlF);
  except
    on EInOutError do
      begin
      ErrorMsg := 'Error: Can''t create file ' + NewXmlFName;
      Exit;
      end;
    end;

  try
    while not Eof(OldXmlF) do
      begin
      ReadLn(OldXmlF, InStr);
      InStr := StringReplace(InStr, OldProjName, NewProjName, [rfReplaceAll]);
      WriteLn(NewXmlF, InStr);
      end;
    Result := True;
  finally
    CloseFile(OldXmlF);
    CloseFile(NewXmlF);
  end;
end;


end.
