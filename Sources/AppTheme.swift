import UIKit

class LocationTheme : AppTheme {
    override var shapeMedium: ShapeStyle {
        ShapeStyle(cornerRadius: 12.0, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
    }
    
}

