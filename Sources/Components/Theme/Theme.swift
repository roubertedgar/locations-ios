import UIKit

protocol Theme {
    var colorPrimary : UIColor {get}
    var colorPrimaryVariant : UIColor {get}
    var colorSecondary : UIColor {get}
    var colorSecondaryVariant : UIColor {get}
    var colorBackground : UIColor {get}
    var colorSurface : UIColor {get}
    var colorError : UIColor {get}
    var colorOnPrimary : UIColor {get}
    var colorOnSecondary : UIColor {get}
    var colorOnBackground : UIColor {get}
    var colorOnSurface : UIColor {get}
    var colorOnError : UIColor {get}
    //shapeLarge
    var shapeMedium : ShapeStyle {get}
    //shapeSmall
    
    //headline1
    //headline2
    //headline3
    //headline4
    //headline5
}

struct ShapeStyle {
    let cornerRadius : CGFloat
    let maskedCorners : CACornerMask
    let borderWidth : CGFloat
    
    init(
        cornerRadius : CGFloat = 0.0,
        maskedCorners : CACornerMask = [.layerMinXMinYCorner ,.layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner],
        borderWidth : CGFloat = 0.0){
            self.cornerRadius = cornerRadius
            self.maskedCorners = maskedCorners
            self.borderWidth = borderWidth
        }
}

class AppTheme : Theme {
    var colorPrimary : UIColor { UIColor.white }
    var colorPrimaryVariant :  UIColor { UIColor.white }
    var colorSecondary :  UIColor { UIColor.white }
    var colorSecondaryVariant :  UIColor { UIColor.white }
    var colorBackground :  UIColor { UIColor.white }
    var colorSurface :  UIColor { UIColor.white }
    var colorError :  UIColor { UIColor.white }
    var colorOnPrimary :  UIColor { UIColor.white }
    var colorOnSecondary :  UIColor { UIColor.white }
    var colorOnBackground :  UIColor { UIColor.white }
    var colorOnSurface :  UIColor { UIColor.white }
    var colorOnError :  UIColor { UIColor.white }
    var shapeMedium : ShapeStyle { ShapeStyle(cornerRadius: 0.0, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]) }
}
