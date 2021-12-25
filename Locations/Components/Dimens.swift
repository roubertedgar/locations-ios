import UIKit

class Dimens {
    
    static var instance : Dimens = {
        return Dimens(UIScreen.main.scale)
    }()
    
    let scale : Double
    
    private init(_ scale : Double){
        self.scale = scale
    }
    
    var tinny : Double{
        switch scale{
        case 1.0 : return 2.0
        case 2.0 : return 4.0
        default : return 8.0
        }
    }
    
    var small : Double{
        switch scale{
        case 1.0 : return 4.0
        case 2.0 : return 10.0
        default : return 16.0
        }
    }
    
    var normal : Double{
        switch scale{
        case 1.0 : return 10.0
        case 2.0 : return 16.0
        default : return 22.0
        }
    }
    
    var large : Double{
        switch scale{
        case 1.0 : return 16.0
        case 2.0 : return 22.0
        default : return 28.0
        }
    }
}
