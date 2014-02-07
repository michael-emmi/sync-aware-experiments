type task a;
type object;
function obj(int) returns (object);

var rootPage: object;
var m_GetResponse: object;

function String.concat(object,object) returns (object);
function String.null(object) returns (bool);
procedure Task.Delay(d: int) returns (r: int) { return; }
procedure DebugPrint(msg: object);
procedure Page.NotifyUser(page: object, msg: object);
procedure WebRequest.Create(url: object) returns (request: object);
procedure WebRequest.GetResponseAsync(req: object) returns (resp_ref: int)
{ return; }
procedure WebResponse.GetResponseStream(resp: object) returns (stream: object);
procedure StreamReader.New(stream: object) returns (reader: object);
procedure StreamReader.ReadToEnd(reader: object) returns (data: object);
  ensures !String.null(data);

const Button1_Click.URL: object;
const Button1_Click.DATA_MSG: object;
const Button1_Click.ERROR_MSG: object;

procedure Button1_Click(Sender: object, EventArgs: object)
{
  var t: task int;
  var i: int;

  call {:async} SendData(Button1_Click.URL);
  goto try.success, try.fail;

try.success:
  assume {:yield} true;
	call {:async t} i := Task.Delay(2000);

  assume {:yield} true;
	assume {:wait t} true;
	assert !String.null(m_GetResponse);

  assume {:yield} true;
  call DebugPrint( String.concat(Button1_Click.DATA_MSG, m_GetResponse) );
  goto try.done;
  
try.fail:
  assume {:yield} true;
  call Page.NotifyUser(rootPage, Button1_Click.ERROR_MSG);
  goto try.done;
  
try.done:
  return;
}

procedure SendData(url: object)
{
	var request: object;
  var response: object;
  var response_ref: int;
  var stream: object;
  var reader: object;
  var result: object;
	var t: task int;
  
  assume {:yield} true;
	call request := WebRequest.Create(url);
	call {:async t} response_ref := WebRequest.GetResponseAsync(request);

  assume {:yield} true;
  assume {:wait response_ref, t} true;
  response := obj(response_ref);
	
  assume {:yield} true;
  call stream := WebResponse.GetResponseStream(response);
	call reader := StreamReader.New(stream);
	call result := StreamReader.ReadToEnd(reader);

  assume {:yield} true;
  m_GetResponse := result;
}

procedure Main()
{
  var Sender: object;
  var EventArgs: object;
  call Button1_Click(Sender, EventArgs);
}
