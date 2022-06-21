import UIKit

protocol Theme {
    var colorPrimary : UIColor {get set}
    var colorPrimaryVariant : UIColor {get set}
    var colorSecondary : UIColor {get set}
    var colorSecondaryVariant : UIColor {get set}
    var colorBackground : UIColor {get set}
    var colorSurface : UIColor {get set}
    var colorError : UIColor {get set}
    var colorOnPrimary : UIColor {get set}
    var colorOnSecondary : UIColor {get set}
    var colorOnBackground : UIColor {get set}
    var colorOnSurface : UIColor {get set}
    var colorOnError : UIColor {get set}
    //shapeLarge
    var shapeMedium : ShapeStyle {get set}
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

class DefaultTheme : Theme {
    
    var colorPrimary: UIColor = UIColor.white
    var colorPrimaryVariant: UIColor = UIColor.white
    var colorSecondary: UIColor = UIColor.white
    var colorSecondaryVariant: UIColor = UIColor.white
    var colorBackground: UIColor = UIColor.white
    var colorSurface: UIColor = UIColor.white
    var colorError: UIColor = UIColor.white
    var colorOnPrimary: UIColor = UIColor.white
    var colorOnSecondary: UIColor = UIColor.white
    var colorOnBackground: UIColor = UIColor.white
    var colorOnSurface: UIColor = UIColor.white
    var colorOnError: UIColor = UIColor.white
    
    
    var shapeMedium = ShapeStyle(cornerRadius: 0.0, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
}
