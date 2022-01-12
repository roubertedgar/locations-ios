import NeedleFoundation

class AppComponent : BootstrapComponent {
    
    var locationListComponent : LocationListComponent{
        return LocationListComponent(parent:  self)
    }
    var splashViewController : SplashViewController{
        return SplashViewController(locationListFactory: locationListComponent)
    }
}
