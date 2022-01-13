import NeedleFoundation
import UIKit

class LocationListComponent : Component<EmptyDependency>, LocationListFactory {
    var httpClient : HttpClient{
        return HttpClient.Builder(baseUrl: "https://hotmart-mobile-app.herokuapp.com")
            .withRequestTimeout(seconds: 15)
            .build()
    }
    
    var locationsAPI : LocationListAPI {
        return LocationListAPI(httpClient: httpClient)
    }
    
    var viewModel : LocationListViewModel {
        return LocationListViewModel(locationListAPI: locationsAPI)
    }
    
    var viewController : UIViewController {
        return LocationListViewController(viewModel: viewModel)
    }
}

protocol LocationListFactory {
    var viewController : UIViewController { get }
}
