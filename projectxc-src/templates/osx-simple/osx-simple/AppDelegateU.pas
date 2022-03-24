unit AppDelegateU;

{$modeswitch ObjectiveC2}

interface

uses
  CocoaAll;

type
  AppDelegate = objcclass(NSObject, NSApplicationDelegateProtocol)
    procedure applicationWillFinishLaunching(aNotification : NSNotification); message 'applicationWillFinishLaunching:';
    procedure applicationWillTerminate(aNotification : NSNotification); message 'applicationWillTerminate:';
    procedure dealloc; override;
  end;
  

implementation

procedure AppDelegate.applicationWillFinishLaunching(aNotification : NSNotification);
begin
end;

procedure AppDelegate.applicationWillTerminate(aNotification : NSNotification);
begin
end;

procedure AppDelegate.dealloc;
begin
  inherited dealloc;
end;


end.
