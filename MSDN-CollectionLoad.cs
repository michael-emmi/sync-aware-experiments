/// SOURCE
/// http://social.msdn.microsoft.com/Forums/windowsapps/en-US/292731da-a979-4519-9a85-d804f8987f61/async-hell-intermittent-loading-of-collection-before-binding

///////app code
public App()
{
    this.InitializeComponent();
    this.VM = new ViewModel();
}

protected async override void OnLaunched(LaunchActivatedEventArgs args)
{
    Frame appFrame = new Frame();
    SuspensionManager.RegisterFrame(appFrame, "AppFrame");
    appFrame.Navigate(typeof(CategoriesPage), this.VM);

    Window.Current.Content = appFrame;
    Window.Current.Activate();
}
///////End app code

///////ViewModel code
public ViewModel()
{
    this.InitializeData();
}

private async void InitializeData()
{
    this.InvFileName = "NVIN_Home.xml";
    await this.DeserializeDataSetAsync();
}
//below in DeserializeDataSetAsync, this.Categories is always populated.
private async Task DeserializeDataSetAsync()
{
    StorageFolder storageFolder = ApplicationData.Current.LocalFolder;
    var dcs = new DataContractSerializer(typeof(ObservableCollection<Category>));
    using (var stream1 = await storageFolder.OpenStreamForReadAsync(this.InvFileName))
    {
	this.Categories = (ObservableCollection<Category>)dcs.ReadObject(stream1);
    }
}

///////End ViewModel code
///////Categoriespage code
//When we arrive here, the this.VM.Categories collection is null about 1/2 of the time.

protected override async void LoadState(Object navigationParameter, Dictionary<String, Object> pageState)
{
    this.VM = navigationParameter as ViewModel;
    this.itemsViewSource.Source = this.VM.Categories;
}
