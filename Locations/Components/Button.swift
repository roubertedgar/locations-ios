import UIKit

class Button : UIButton{
    
    @IBInspectable
    var localizedTitle:String = ""{
        didSet{
            self.setTitle(getString(localizedTitle), for: .normal)
        }
    }
}
