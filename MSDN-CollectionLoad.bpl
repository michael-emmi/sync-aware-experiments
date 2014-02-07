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
procedure StorageFolder.OpenStreamForReadAsync(folder: object, filename: object) returns (st_ref: int)
{
  return;
}
procedure ViewSource.SetSource(vs: object, s: object);

var VM: object;
var categories: [object] object;
var itemsViewSource: object;

procedure Main()
{
  var args: object;
  var pageState: object;

  call App();
  call {:async} OnLaunched(args);
  call {:async} LoadState(VM, pageState);
  return;
}

procedure App()
{
  var vm_ref: int;

  assume {:yield} true;
  call InitializeComponent();

  assume {:yield} true;
  call vm_ref := ViewModel.New();

  assume {:yield} true;
  VM := obj(vm_ref);

  return;
}

procedure InitializeComponent();

const OnLaunched.FRAME_STR: object;

procedure OnLaunched(args: object)
{
  var appFrame: object;
  var catType: object;
  var current: object;

  assume {:yield} true;
  call appFrame := Frame.New();

  assume {:yield} true;
  call SuspensionManager.RegisterFrame(appFrame, OnLaunched.FRAME_STR);

  assume {:yield} true;
  call Frame.Navigate(appFrame, catType, VM);

  assume {:yield} true;
  call current := Window.Current();

  assume {:yield} true;
  call Window.SetContent(current, appFrame);

  assume {:yield} true;
  call Window.Activate(current);

  return;
}

procedure LoadState(navigationParameter: object, pageState: object)
{
  var cs: object;

  assume {:yield} true;
  VM := navigationParameter;

  assume {:yield} true;
  call cs := ViewModel.GetCategories(VM);

  assume {:yield} true;
  assert !Object.isNull(cs);

  assume {:yield} true;
  call ViewSource.SetSource(itemsViewSource, cs);

  return;
}

procedure ViewModel.New() returns (vm_ref: int)
{
  call {:async} ViewModel.InitializeData(obj(vm_ref));
  return;
}

const ViewModel.InitializeData.FN_STR: object;

procedure ViewModel.InitializeData(vm: object)
{
  var t: task int;

  assume {:yield} true;
  call ViewModel.SetInvFileName(vm, ViewModel.InitializeData.FN_STR);

  assume {:yield} true;
  call {:async t} ViewModel.DeserializeDataSetAsync(vm);

  assume {:yield} true;
  assume {:wait t} true;
  return;
}

procedure ViewModel.DeserializeDataSetAsync(vm: object)
{
  var t: task int;
  var current: object;
  var storageFolder: object;
  var ty: object;
  var dcs: object;
  var filename: object;
  var stream1_ref: int;
  var stream1: object;
  var cs: object;
  
  assume {:yield} true;
  call current := ApplicationData.Current();

  assume {:yield} true;
  call storageFolder := ApplicationData.LocalFolder(current);

  assume {:yield} true;
  call dcs := DataContractSerializer.New(ty);

  assume {:yield} true;
  call filename := ViewModel.InvFileName(vm);

  assume {:yield} true;
  call {:async t} stream1_ref := StorageFolder.OpenStreamForReadAsync(storageFolder, filename);

  assume {:yield} true;
  assume {:wait stream1_ref, t} true;

  assume {:yield} true;
  stream1 := obj(stream1_ref);

  assume {:yield} true;
  call cs := DataContractSerializer.ReadObject(dcs,stream1);

  assume {:yield} true;
  call ViewModel.SetCategories(vm, cs);

  return;
}

procedure ViewModel.InvFileName(vm: object) returns (filename: object);
procedure ViewModel.SetInvFileName(vm: object, filename: object);

procedure ViewModel.SetCategories(vm: object, cat: object)
{
  categories[vm] := cat;
  return;
}

procedure ViewModel.GetCategories(vm: object) returns (cat: object)
{
  cat := categories[vm];
  return;
}

