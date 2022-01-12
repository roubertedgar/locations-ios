import UIKit

extension UIViewController {
    
    var topBarHeight: CGFloat {
        return statusBarFrame.height + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
