import UIKit

class Theme{
    
    static let instance = Theme()
    
    //colorPrimary
    //colorPrimaryVariant
    //colorSecondary
    //colorSecondaryVariant
    
    //colorBackground
    //colorSurface
    //colorError
    
    //colorOnPrimary
    //colorOnSecondary
    //colorOnBackground
    //colorOnSurface
    //colorOnError
    
    //shapeLarge
    let shapeMedium = ShapeStyle(cornerRadius: 12.0, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
    //shapeSmall
    
    //headline1
    //headline2
    //headline3
    //headline4
    //headline5
    
    private init(){
        
    }
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
