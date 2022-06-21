import UIKit

class AppTheme : Theme {
    var colorPrimary = UIColor.systemBlue
    var colorPrimaryVariant = UIColor.blue
    var colorSecondary = UIColor.gray
    var colorSecondaryVariant = UIColor.darkGray
    var colorBackground = UIColor.white
    var colorSurface = UIColor.white
    var colorError = UIColor.red
    var colorOnPrimary = UIColor.black
    var colorOnSecondary = UIColor.black
    var colorOnBackground = UIColor.black
    var colorOnSurface = UIColor.darkGray
    var colorOnError = UIColor.white
    var shapeMedium = ShapeStyle(cornerRadius: 12.0, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
}
