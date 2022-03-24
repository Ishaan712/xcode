unit ViewControllerU;

{$modeswitch ObjectiveC2}

interface

uses
  CocoaAll;

type
  ViewController = objcclass(NSViewController)
     {IBOutlets}

//    procedure viewDidLoad; override;  //not in CocoaAll; added to OS X 10.10
    procedure setRepresentedObject(representedObject: id); override;
    procedure dealloc; override;

     {IBActions}

  end;
  

implementation

//procedure ViewController.viewDidLoad;
//begin
//  inherited viewDidLoad;
//end;

procedure ViewController.setRepresentedObject(representedObject: id);
begin
 inherited setRepresentedObject(representedObject);
end;

procedure ViewController.dealloc;
begin
  inherited dealloc;
end;


end.
