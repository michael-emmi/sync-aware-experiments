/// SOURCE
/// http://www.codeproject.com/Articles/562021/Asynchronous-models-and-patterns

class LayoutAwarePage : Page
{
    string _pageKey;
    protected override void OnNavigatedTo(NavigationEventArgs e)
    {
        if (this._pageKey != null)
            return;
        this._pageKey = "Page-" + this.Frame.BackStackDepth;
        this.LoadState(e.Parameter, null);
    }
}

BitmapImage m_bmp;
protected override async void OnNavigatedTo(NavigationEventArgs e)
{
    base.OnNavigatedTo(e);
    await PlayIntroSoundAsync();
    image1.Source = m_bmp;
    Canvas.SetLeft(image1, Window.Current.Bounds.Width - m_bmp.PixelWidth);
}
protected override async void LoadState(Object nav, Dictionary<String, Object> pageState)
{
    m_bmp = new BitmapImage();
    var file = await StorageFile.GetFileFromApplicationUriAsync("ms-appx:///pic.png");
    using (var stream = await file.OpenReadAsync())
        await m_bmp.SetSourceAsync(stream);
}

