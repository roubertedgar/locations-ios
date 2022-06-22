import UIKit

class View : UIView {
    
    var theme : Theme
    
    init(theme: Theme = ThemeManager.shared.theme){
        self.theme = theme
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        self.theme = ThemeManager.shared.theme
        super.init(coder: coder)
    }
}
