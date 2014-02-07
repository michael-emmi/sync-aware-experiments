/// SOURCE 
/// http://www.codeproject.com/Articles/562021/Asynchronous-models-and-patterns

string m_GetResponse;
async void Button1_Click(object Sender, EventArgs e)
{
    try
    {
        SendData("https://secure.flickr.com/services/oauth/request_token");
        await Task.Delay(2000);
        DebugPrint("Received Data: " + m_GetResponse); 
    }
    catch (Exception ex)
    {
        rootPage.NotifyUser("Error posting data to server." + ex.Message);
    }
}

async void SendData(string url)
{
    var request = WebRequest.Create(url);
    using (var response = await request.GetResponseAsync())
        using (var stream = new StreamReader(response.GetResponseStream()))
            m_GetResponse = stream.ReadToEnd();
}
