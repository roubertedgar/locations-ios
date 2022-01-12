import UIKit

class SplashViewController : UIViewController {
    
    private let locationLisFactory : LocationListFactory
    init(locationListFactory : LocationListFactory){
        self.locationLisFactory = locationListFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    
        navigationController?.pushViewController(locationLisFactory.viewController, animated: true)
    }
}
