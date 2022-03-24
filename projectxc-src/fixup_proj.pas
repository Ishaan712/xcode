program fixup_proj;

{
  Program that fixes up an Xcode project's .pbxproj, .storyboard or
   .xcworkspacedata file (for example, after duplicating an existing project).

  Author:    Phil Hess.
  Copyright: Copyright (C) Phil Hess.
  License:   Modified LGPL (see Free Pascal's rtl/COPYING.FPC).
}

{$IFDEF FPC}
 {$mode objfpc}{$H+}
{$ELSE}
 {$APPTYPE CONSOLE}
{$ENDIF}

uses
  SysUtils,
  projutils;
  
var
  ErrorMsg : string;
begin
  if ParamCount <> 5 then
    begin
    WriteLn('Invalid number of parameters');
    Halt(1);
    end;

  if SameText(ParamStr(1), 'pbxproj') then
    begin
    if not FixupPbxprojFile(ParamStr(2), ParamStr(3), ParamStr(4), ParamStr(5), 
                            '', ErrorMsg) then
      begin
      WriteLn(ErrorMsg);
      Halt(2);
      end;
    end
  else if SameText(ParamStr(1), 'xml') then
    begin
    if not FixupXmlFile(ParamStr(2), ParamStr(3), ParamStr(4), ParamStr(5), 
                        ErrorMsg) then
      begin
      WriteLn(ErrorMsg);
      Halt(3);
     end;
    end
  else
    begin
    WriteLn('Invalid option: ', ParamStr(1));
    Halt(4);
    end;
end.
