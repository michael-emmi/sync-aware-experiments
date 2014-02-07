type task a;
type object;
function obj(int) returns (object);

const Object.null: object;
function Object.isNull(o: object) returns (bool) { o == Object.null }

function String.concat(object,object) returns (object);
function String.fromInt(int) returns (object);

procedure Frame.BackStackDepth() returns (depth: int);
procedure NavigationEventArgs.Parameter(args: object) returns (p: object);
procedure PlayIntroSoundAsync() { 
  return;
}
procedure Image.SetSource(im: object, bmp: object);
procedure Window.Current() returns (win: object);
procedure Window.Bounds(win: object) returns (rect: object);
procedure Rectangle.Width(rect: object) returns (len: int);
procedure BitmapImage.New() returns (bmp: object);
  ensures !Object.isNull(bmp);
procedure BitmapImage.PixelWidth(bmp: object) returns (len: int);
procedure BitmapImage.SetSourceAsync(bmp: object, stream: object)
{
  return;
}
procedure Canvas.SetLeft(uiElem: object, len: int);

procedure StorageFile.GetFileFromApplicationUriAsync(uri: object) 
  returns (file_ref: int) 
{
  return; 
}
procedure StorageFile.OpenReadAsync(file: object) returns (stream_ref: int)
{
 return;
}

var _pageKey: object;
var image1: object;
var m_bmp: object;

const LayoutAwarePage.OnNavigatedTo.PAGE_STR: object;

procedure LayoutAwarePage.OnNavigatedTo(eventArgs: object)
{
  var t: task int;
  var depth: int;
  var param: object;

  assume {:yield} true;
  if (!Object.isNull(_pageKey)) {
    return;
  }
    
  assume {:yield} true;
  call depth := Frame.BackStackDepth();

  assume {:yield} true;
  _pageKey := String.concat(
    LayoutAwarePage.OnNavigatedTo.PAGE_STR, 
    String.fromInt(depth));
    
  assume {:yield} true;
  call param := NavigationEventArgs.Parameter(eventArgs);

  assume {:yield} true;
  call {:async} LoadState(param, Object.null);

  return;
}

procedure OnNavigatedTo(eventArgs: object)
{
	var t: task int;
  var current: object;
  var bounds: object;
  var width1: int;
  var width2: int;
  
  assume {:yield} true;
  call LayoutAwarePage.OnNavigatedTo(eventArgs);

  assume {:yield} true;
  call {:async t} PlayIntroSoundAsync();  
  
  assume {:yield} true;
  assume {:wait t} true;
  
  assume {:yield} true;
  assert !Object.isNull(m_bmp);

  assume {:yield} true;
  call Image.SetSource(image1, m_bmp);

  assume {:yield} true;
  call current := Window.Current();

  assume {:yield} true;
  call bounds := Window.Bounds(current);

  assume {:yield} true;
  call width1 := Rectangle.Width(bounds);

  assume {:yield} true;
  call width2 := BitmapImage.PixelWidth(m_bmp);

  assume {:yield} true;
  call Canvas.SetLeft(image1, width1 - width2);
  
  return;
}

const LoadState.URI_STR: object;

procedure LoadState(nav: object, pageState: object)
{
  var bmp: object;
  var t: task int;
  var file_ref: int;
  var file: object;
  var stream_ref: int;
  var stream: object;
  
  assume {:yield} true;
  call bmp := BitmapImage.New();
  m_bmp := bmp;

  assume {:yield} true;
  call {:async t} file_ref := StorageFile.GetFileFromApplicationUriAsync(LoadState.URI_STR);

  assume {:yield} true;
  assume {:wait file_ref, t} true;
  file := obj(file_ref);
  
  assume {:yield} true;
  call {:async t} stream_ref := StorageFile.OpenReadAsync(file);

  assume {:yield} true;
  assume {:wait stream_ref, t} true;
  stream := obj(stream_ref);
  
  assume {:yield} true;
  call {:async t} BitmapImage.SetSourceAsync(m_bmp, stream);

  assume {:yield} true;
  assume {:wait t} true;
  
  return;
}

procedure Main()
{
  var args: object;
  _pageKey := Object.null;
  call OnNavigatedTo(args);
}

