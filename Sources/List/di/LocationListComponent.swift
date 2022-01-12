import NeedleFoundation
import UIKit

class LocationListComponent : Component<EmptyDependency>, LocationListFactory {
    var httpClient : HttpClient{
        return HttpClient(baseUrl: "https://hotmart-mobile-app.herokuapp.com")
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
