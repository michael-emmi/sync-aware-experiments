type task a;
type object = int;

function obj(int) returns (object);

const Object.null: object;
function Object.isNull(o: object) returns (bool) { o == Object.null }

procedure Frame.New() returns (f: object);
procedure Frame.Navigate(fr: object, ty: object, vm: object);
procedure SuspensionManager.RegisterFrame(fr: object, name: object);
procedure Window.Current() returns (w: object);
procedure Window.SetContent(window: object, frame: object);
procedure Window.Activate(window: object);
procedure ApplicationData.Current() returns (ad: object);
procedure ApplicationData.LocalFolder(ad: object) returns (f: object);
procedure DataContractSerializer.New(ty: object) returns (dcs: object);
procedure DataContractSerializer.ReadObject(dcs: object, st: object)
  returns (cat: object);
  ensures !Object.isNull(cat);
procedure StorageFolder.OpenStreamForReadA(folder: object, filename: object) returns (st_ref: int)
{
  return;
}
procedure ViewSource.SetSource(vs: object, s: object);

var VM: object;
var categories: [object] object;
var itemsViewSource: object;

/******************************************************************************/

var $num_threads: int;
var $num_steps: int;
var $num_frames: int;

var $steps: [int] int;
var $frames: [int] [int] int;
var $completed: [int] bool;

var $proc_name: [int] int;
var $control_loc: [int] int;

// PROCEDURE NAMES
const unique $Main: int;
const unique $App: int;
const unique $OnLaunched: int;
const unique $LoadState: int;
const unique $ViewModel.New: int;
const unique $ViewModel.InitializeData: int;
const unique $ViewModel.DeserializeDataSetA: int;
const unique $StorageFolder.OpenStreamForReadA: int;

// LOCAL VARIABLE STORAGE
var $Main.args: [int] object;
var $Main.pageState: [int] object;

var $App.vm_ref: [int] int;
var $OnLaunched.args: [int] object;
var $OnLaunched.appFrame: [int] object;
var $OnLaunched.catType: [int] object;
var $OnLaunched.current: [int] object;

var $LoadState.navigationParameter: [int] object;
var $LoadState.pageState: [int] object;
var $LoadState.cs: [int] object;
// ... 
var $ViewModel.New.vm_ref: [int] object;

var $ViewModel.InitializeData.vm: [int] object;
var $ViewModel.InitializeData.t: [int] int;

var $ViewModel.DeserializeDataSetA.t: [int] int;
var $ViewModel.DeserializeDataSetA.current: [int] object;
var $ViewModel.DeserializeDataSetA.storageFolder: [int] object;
var $ViewModel.DeserializeDataSetA.ty: [int] object;
var $ViewModel.DeserializeDataSetA.dcs: [int] object;
var $ViewModel.DeserializeDataSetA.filename: [int] object;
var $ViewModel.DeserializeDataSetA.stream1_ref: [int] object;
var $ViewModel.DeserializeDataSetA.stream1: [int] object;
var $ViewModel.DeserializeDataSetA.cs: [int] object;
var $ViewModel.DeserializeDataSetA.vm: [int] object;

var $StorageFolder.OpenStreamForReadA.folder: [int] object;
var $StorageFolder.OpenStreamForReadA.filename: [int] object;

const $top_frame: int;
axiom $top_frame == -1;

var $step: int;
var $next_step: int;
var $depth: int;

procedure $talloc() returns (t: int) 
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  t := $num_threads;
  $completed[t] := false;
  $num_threads := $num_threads + 1;
  return;
}
procedure $salloc() returns (s: int) 
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  s := $num_steps;
  $num_steps := $num_steps + 1;
  return;
}
procedure $falloc() returns (f: int) 
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  f := $num_frames;
  $num_frames := $num_frames + 1;
  return;
}

procedure $RESUME(pn: int) returns (frame: int, loc: int, first: bool)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  $depth := $depth + 1;  
  if ($frames[$step][$depth] == $top_frame) {
    call frame := $falloc();
    $frames[$step][$depth] := frame;
    $proc_name[frame] := pn;
    loc := 0;
    first := true;
  } else {
    frame := $frames[$step][$depth];
    assume $proc_name[frame] == pn;
    loc := $control_loc[frame];
    first := false;
  }  
  $frames[$next_step][$depth+1] := $top_frame;
  return;
}

procedure $PAUSE(pn: int, loc: int, last: int) returns (frame: int)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var next_loc: int;

  if ($frames[$next_step][$depth+1] == $top_frame) {
    next_loc := loc + 1;
  } else {
    next_loc := loc;
  }
  
  if (next_loc > last) {
    $frames[$next_step][$depth] := $top_frame;
    
  } else {
    call frame := $falloc();
    $proc_name[frame] := pn;
    $control_loc[frame] := next_loc;
    $frames[$next_step][$depth] := frame;
  }
  $depth := $depth - 1;
  return;
}

procedure $THREAD(pn: int) returns (f: int, t: int)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var s: int;
  call t := $talloc();
  call s := $salloc();
  call f := $falloc();
  $steps[t] := s;
  $frames[s][0] := f;
  $frames[s][1] := $top_frame;
  $proc_name[f] := pn;
  $control_loc[f] := 0;
  return;
}

procedure {:entrypoint} $DISPATCH()
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var t: int;  
  var f: int;
  var $o1: object;  
  var $o2: object;
  var $i1: int;
  
  var i: int;
  i := 0;
  
  $num_threads := 0;
  $num_steps := 0;
  $num_frames := 0;
  
  call f, t := $THREAD($Main);

  while (*) {
    havoc t;
    assume t >= 0;
    assume t < $num_threads;
    $step := $steps[t];
    assume $frames[$step][0] != $top_frame;
    call $next_step := $salloc();
    $depth := -1;
    
    call boogie_si_record_int(t);
    call boogie_si_record_int($step);
    call boogie_si_record_int($frames[$step][0]);
    call boogie_si_record_int($frames[$step][1]);
    call boogie_si_record_int($frames[$step][2]);
    
    i := i + 1;
/*    assert i != 8;*/

    goto $bb0, $bb1, $bb2, $bb3, $bb4, $bb5, $bb6;
    
$bb0:
    call Main();
    goto $done;

$bb1:
    call App();
    goto $done;
    
$bb2:
    call OnLaunched($o1);
    goto $done;

$bb3:
    call LoadState($o1, $o2);
    goto $done;
    
$bb4:
    call $i1 := ViewModel.New();
    goto $done;
    
$bb5:
    call ViewModel.InitializeData($o1);
    goto $done;
    
$bb6:
    call ViewModel.DeserializeDataSetA($o1);
    goto $done;
    
$done:
    $steps[t] := $next_step;
    if ($frames[$next_step][0] == $top_frame) {
      $completed[t] := true;
    }    
  }
}

/******************************************************************************/

procedure Main()
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var args: object;
  var pageState: object;
  var t: int;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($Main);
  if (!$first) {
    args := $Main.args[$frame];
    pageState := $Main.pageState[$frame];
  }
  goto $bb0, $bb1, $bb2;

$bb0:
  assume $loc == 0;
  call App();
  goto $ret;

$bb1:
  // call {:A} OnLaunched(args);
  assume $loc == 1;
  call $frame, t := $THREAD($OnLaunched);
  $OnLaunched.args[$frame] := args;
  goto $ret;
  
$bb2:
  // call {:A} LoadState(VM, pageState);
  assume $loc == 2;
  call $frame, t := $THREAD($LoadState);
  $LoadState.navigationParameter[$frame] := VM;
  $LoadState.pageState[$frame] := pageState;
  goto $ret;
  
$ret:
  call $frame := $PAUSE($Main, $loc, 2);
  $Main.args[$frame] := args;
  $Main.pageState[$frame] := pageState;
  return;
}

procedure App()
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var vm_ref: int;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($App);
  if (!$first) {
    vm_ref := $App.vm_ref[$frame];
  }
  goto $bb0, $bb1, $bb2;

$bb0:
  assume $loc == 0;
  call InitializeComponent();
  goto $ret;

$bb1:
  assume $loc == 1;
  call vm_ref := ViewModel.New();
  goto $ret;
  
$bb2:
  assume $loc == 2;
  VM := obj(vm_ref);
  goto $ret;

$ret:
  call $frame := $PAUSE($App, $loc, 2);
  $App.vm_ref[$frame] := vm_ref;
  return;
}



procedure InitializeComponent();

const OnLaunched.FRAME_STR: object;

procedure OnLaunched(args0: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var args: object;
  var appFrame: object;
  var catType: object;
  var current: object;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($OnLaunched);
  if ($first) {
    args := args0;
  } else {
    args := $OnLaunched.args[$frame]; 
    appFrame := $OnLaunched.appFrame[$frame];
    catType := $OnLaunched.catType[$frame];
    current := $OnLaunched.current[$frame];
  } 
  goto $bb0, $bb1, $bb2, $bb3, $bb4, $bb5;

$bb0:
  assume $loc == 0;
  call appFrame := Frame.New();
  goto $ret;

$bb1:
  assume $loc == 1;
  call SuspensionManager.RegisterFrame(appFrame, OnLaunched.FRAME_STR);
  goto $ret;

$bb2:
  assume $loc == 2;
  call Frame.Navigate(appFrame, catType, VM);
  goto $ret;

$bb3:
  assume $loc == 3;
  call current := Window.Current();
  goto $ret;

$bb4:
  assume $loc == 4;
  call Window.SetContent(current, appFrame);
  goto $ret;

$bb5:
  assume $loc == 5;
  call Window.Activate(current);
  goto $ret;

$ret:
  call $frame := $PAUSE($OnLaunched, $loc, 5);
  $OnLaunched.args[$frame] := args;
  $OnLaunched.appFrame[$frame] := appFrame;
  $OnLaunched.catType[$frame] := catType;
  $OnLaunched.current[$frame] := current;
  return;
}

procedure LoadState(navigationParameter0: object, pageState0: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var cs: object;
  var navigationParameter: object;
  var pageState: object;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($LoadState);
  if ($first) {
    navigationParameter := navigationParameter0;
    pageState := pageState0;
  } else {
    navigationParameter := $LoadState.navigationParameter[$frame]; 
    pageState := $LoadState.pageState[$frame]; 
    cs := $LoadState.cs[$frame]; 
  }
  goto $bb0, $bb1, $bb2, $bb3;

$bb0:
  assume $loc == 0;
  VM := navigationParameter;
  goto $ret;

$bb1:
  assume $loc == 1;
  call cs := ViewModel.GetCategories(VM);
  goto $ret;

$bb2:
  assume $loc == 2;
  assert !Object.isNull(cs);
  goto $ret;

$bb3:
  assume $loc == 3;
  call ViewSource.SetSource(itemsViewSource, cs);
  goto $ret;

$ret:
  call $frame := $PAUSE($LoadState, $loc, 3);
  $LoadState.navigationParameter[$frame] := navigationParameter;
  $LoadState.pageState[$frame] := pageState;
  $LoadState.cs[$frame] := cs;
  return;
}

procedure ViewModel.New() returns (vm_ref: int)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{  
  var t: int;

  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($ViewModel.New);
  if (!$first) {
    vm_ref := $ViewModel.New.vm_ref[$frame]; 
  }
  goto $bb0;

$bb0:
  assume $loc == 0;
  // call {:A} ViewModel.InitializeData(obj(vm_ref));
  call $frame, t := $THREAD($ViewModel.InitializeData);
  $ViewModel.InitializeData.vm[$frame] := obj(vm_ref);
  goto $ret;

$ret:
  call $frame := $PAUSE($ViewModel.New, $loc, 0);
  $ViewModel.New.vm_ref[$frame] := vm_ref;
  return;
}

const ViewModel.InitializeData.FN_STR: object;

procedure ViewModel.InitializeData(vm0: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var t: int;
  var vm: object;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($ViewModel.InitializeData);
  if ($first) {
    vm := vm0;
  } else {
    vm := $ViewModel.InitializeData.vm[$frame]; 
    t := $ViewModel.InitializeData.t[$frame]; 
  }
  goto $bb0, $bb1, $bb2;

$bb0:
  assume $loc == 0;
  call ViewModel.SetInvFileName(vm, ViewModel.InitializeData.FN_STR);
  goto $ret;

$bb1:
  assume $loc == 1;
  // call {:A t} ViewModel.DeserializeDataSetA(vm);
  call $frame, t := $THREAD($ViewModel.DeserializeDataSetA);
  $ViewModel.DeserializeDataSetA.vm[$frame] := vm;
  goto $ret;

$bb2:
  assume $loc == 2;
  // assume {:wait t} true;
  assume $completed[t];
  goto $ret;
  
$ret:
  call $frame := $PAUSE($ViewModel.InitializeData, $loc, 2);
  $ViewModel.InitializeData.vm[$frame] := vm;
  $ViewModel.InitializeData.t[$frame] := t;
  return;
}

procedure ViewModel.DeserializeDataSetA(vm: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  var t: int;
  var current: object;
  var storageFolder: object;
  var ty: object;
  var dcs: object;
  var filename: object;
  var stream1_ref: int;
  var stream1: object;
  var cs: object;
  
  var $frame: int;
  var $loc: int;  
  var $first: bool;
  call $frame, $loc, $first := $RESUME($ViewModel.DeserializeDataSetA);
  if (!$first) {
    t := $ViewModel.DeserializeDataSetA.t[$frame]; 
    current := $ViewModel.DeserializeDataSetA.current[$frame]; 
    storageFolder := $ViewModel.DeserializeDataSetA.storageFolder[$frame]; 
    ty := $ViewModel.DeserializeDataSetA.ty[$frame]; 
    dcs := $ViewModel.DeserializeDataSetA.dcs[$frame]; 
    filename := $ViewModel.DeserializeDataSetA.filename[$frame]; 
    stream1_ref := $ViewModel.DeserializeDataSetA.stream1_ref[$frame]; 
    stream1 := $ViewModel.DeserializeDataSetA.stream1[$frame]; 
    cs := $ViewModel.DeserializeDataSetA.cs[$frame]; 
  }
  goto $bb0, $bb1, $bb2, $bb3, $bb4, $bb5, $bb6, $bb7, $bb8;
  
$bb0:
  assume $loc == 0;
  call current := ApplicationData.Current();
  goto $ret;

$bb1:
  assume $loc == 1;
  call storageFolder := ApplicationData.LocalFolder(current);
  goto $ret;

$bb2:
  assume $loc == 2;
  call dcs := DataContractSerializer.New(ty);
  goto $ret;

$bb3:
  assume $loc == 3;
  call filename := ViewModel.InvFileName(vm);
  goto $ret;

$bb4:
  assume $loc == 4;
  call $frame, t := $THREAD($StorageFolder.OpenStreamForReadA);
  $StorageFolder.OpenStreamForReadA.folder[$frame] := storageFolder;
  $StorageFolder.OpenStreamForReadA.filename[$frame] := filename;
  goto $ret;

$bb5:
  assume $loc == 5;
  assume $completed[t];
  havoc stream1_ref;
  goto $ret;

$bb6:
  assume $loc == 6;
  stream1 := obj(stream1_ref);
  goto $ret;

$bb7:
  assume $loc == 7;
  call cs := DataContractSerializer.ReadObject(dcs,stream1);
  goto $ret;

$bb8:
  assume $loc == 8;
  call ViewModel.SetCategories(vm, cs);
  goto $ret;
  
$ret:
  call $frame := $PAUSE($ViewModel.DeserializeDataSetA, $loc, 8);
  $ViewModel.DeserializeDataSetA.t[$frame] := t; 
  $ViewModel.DeserializeDataSetA.current[$frame] := current; 
  $ViewModel.DeserializeDataSetA.storageFolder[$frame] := storageFolder; 
  $ViewModel.DeserializeDataSetA.ty[$frame] := ty; 
  $ViewModel.DeserializeDataSetA.dcs[$frame] := dcs; 
  $ViewModel.DeserializeDataSetA.filename[$frame] := filename; 
  $ViewModel.DeserializeDataSetA.stream1_ref[$frame] := stream1_ref; 
  $ViewModel.DeserializeDataSetA.stream1[$frame] := stream1; 
  $ViewModel.DeserializeDataSetA.cs[$frame] := cs; 
  return;
}

procedure ViewModel.InvFileName(vm: object) returns (filename: object);
procedure ViewModel.SetInvFileName(vm: object, filename: object);

procedure ViewModel.SetCategories(vm: object, cat: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  categories[vm] := cat;
  return;
}

procedure ViewModel.GetCategories(vm: object) returns (cat: object)
modifies VM, categories, itemsViewSource, $num_threads, $num_steps,
$num_frames, $steps, $frames, $completed, $proc_name, $control_loc,
$Main.args, $Main.pageState, $App.vm_ref, $OnLaunched.args,
$OnLaunched.appFrame, $OnLaunched.catType, $OnLaunched.current,
$LoadState.navigationParameter, $LoadState.pageState, $LoadState.cs,
$ViewModel.New.vm_ref, $ViewModel.InitializeData.vm,
$ViewModel.InitializeData.t, $ViewModel.DeserializeDataSetA.t,
$ViewModel.DeserializeDataSetA.current,
$ViewModel.DeserializeDataSetA.storageFolder,
$ViewModel.DeserializeDataSetA.ty, $ViewModel.DeserializeDataSetA.dcs,
$ViewModel.DeserializeDataSetA.filename,
$ViewModel.DeserializeDataSetA.stream1_ref,
$ViewModel.DeserializeDataSetA.stream1, $ViewModel.DeserializeDataSetA.cs,
$ViewModel.DeserializeDataSetA.vm, $StorageFolder.OpenStreamForReadA.folder,
$StorageFolder.OpenStreamForReadA.filename, $step, $next_step, $depth;
{
  cat := categories[vm];
  return;
}

