import UIKit

class SplashViewController : UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
    
        navigationController?.pushViewController(LocationListViewController(), animated: true)
    }
}
