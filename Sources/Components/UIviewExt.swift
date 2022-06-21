import UIKit

extension UIResponder {
    var dimens : Dimens {Dimens.instance} 
}

extension UIResponder {
    
    var scene: UIWindowScene? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })
    }
    
    var keyWindow: UIWindow {
        scene?.windows.first { window in window.isKeyWindow } ?? UIWindow()
    }
    
    var statusBarFrame : CGRect {
        return scene?.statusBarManager?.statusBarFrame ?? CGRect()
    }
    
    var safeInsets : UIEdgeInsets {
        return keyWindow.safeAreaInsets
    }
}

extension UIView {
    var theme: Theme {
        get {
            return ThemeManager.shared.theme
        }
    }
}
