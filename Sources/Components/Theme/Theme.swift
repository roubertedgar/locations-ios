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
    
    func copy(
        colorPrimary : UIColor?,
        colorPrimaryVariant : UIColor? ,
        colorSecondary : UIColor? ,
        colorSecondaryVariant : UIColor? ,
        colorBackground : UIColor? ,
        colorSurface : UIColor? ,
        colorError : UIColor? ,
        colorOnPrimary : UIColor? ,
        colorOnSecondary : UIColor? ,
        colorOnBackground : UIColor? ,
        colorOnSurface : UIColor? ,
        colorOnError : UIColor? ,
        shapeMedium : ShapeStyle?
    ) -> Theme
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
    
    var colorPrimary: UIColor
    var colorPrimaryVariant: UIColor
    var colorSecondary: UIColor
    var colorSecondaryVariant: UIColor
    var colorBackground: UIColor
    var colorSurface: UIColor
    var colorError: UIColor
    var colorOnPrimary: UIColor
    var colorOnSecondary: UIColor
    var colorOnBackground: UIColor
    var colorOnSurface: UIColor
    var colorOnError: UIColor
    var shapeMedium : ShapeStyle
    
    init(
        colorPrimary: UIColor = UIColor.white ,
        colorPrimaryVariant: UIColor = UIColor.white ,
        colorSecondary: UIColor = UIColor.white ,
        colorSecondaryVariant: UIColor = UIColor.white ,
        colorBackground: UIColor = UIColor.white ,
        colorSurface: UIColor = UIColor.white ,
        colorError: UIColor = UIColor.white ,
        colorOnPrimary: UIColor = UIColor.white ,
        colorOnSecondary: UIColor = UIColor.white ,
        colorOnBackground: UIColor = UIColor.white ,
        colorOnSurface: UIColor = UIColor.white ,
        colorOnError: UIColor = UIColor.white,
        shapeMedium: ShapeStyle = ShapeStyle(cornerRadius: 0.0, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])) {
            
            self .colorPrimary = colorPrimary
            self .colorPrimaryVariant = colorPrimaryVariant
            self .colorSecondary = colorSecondary
            self .colorSecondaryVariant = colorSecondaryVariant
            self .colorBackground = colorBackground
            self .colorSurface = colorSurface
            self .colorError = colorError
            self .colorOnPrimary = colorOnPrimary
            self .colorOnSecondary = colorOnSecondary
            self .colorOnBackground = colorOnBackground
            self .colorOnSurface = colorOnSurface
            self .colorOnError = colorOnError
            self .shapeMedium = shapeMedium
        }
    
    func copy(
        colorPrimary: UIColor? = nil,
        colorPrimaryVariant: UIColor? = nil,
        colorSecondary: UIColor? = nil,
        colorSecondaryVariant: UIColor? = nil,
        colorBackground: UIColor? = nil,
        colorSurface: UIColor? = nil,
        colorError: UIColor? = nil,
        colorOnPrimary: UIColor? = nil,
        colorOnSecondary: UIColor? = nil,
        colorOnBackground: UIColor? = nil,
        colorOnSurface: UIColor? = nil,
        colorOnError: UIColor? = nil,
        shapeMedium: ShapeStyle? = nil) -> Theme {
            return DefaultTheme(
                colorPrimary: colorPrimary ?? self.colorPrimary,
                colorPrimaryVariant: colorPrimaryVariant ?? self.colorPrimaryVariant,
                colorSecondary: colorSecondary ?? self.colorSecondary,
                colorSecondaryVariant: colorSecondaryVariant ?? self.colorSecondaryVariant,
                colorBackground: colorBackground ?? self.colorBackground,
                colorSurface: colorSurface ?? self.colorSurface,
                colorError: colorError ?? self.colorError,
                colorOnPrimary: colorOnPrimary ?? self.colorOnPrimary,
                colorOnSecondary: colorOnSecondary ?? self.colorOnSecondary,
                colorOnBackground: colorOnBackground ?? self.colorOnBackground,
                colorOnSurface: colorOnSurface ?? self.colorOnSurface,
                colorOnError: colorOnError ?? self.colorOnError,
                shapeMedium: shapeMedium ?? self.shapeMedium
            )
        }
    
}
