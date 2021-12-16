import UIKit

class TextField : UITextField{
    
    @IBInspectable
    var localizedPlaceholder: String = ""{
        didSet{
            self.placeholder = getString(localizedPlaceholder)
        }
    }
}
