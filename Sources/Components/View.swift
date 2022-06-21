import UIKit

class View : UIView {
    
    var theme: Theme {
        get {
            return ThemeManager.shared.theme
        }
    }
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
