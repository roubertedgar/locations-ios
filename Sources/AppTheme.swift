import UIKit

class AppTheme : DefaultTheme {
    init() {
        super.init(
            colorPrimary:  UIColor.white,
            colorPrimaryVariant:  UIColor.white,
            colorSecondary:  UIColor.white,
            colorSecondaryVariant:  UIColor.white,
            colorBackground:  UIColor.white,
            colorSurface:  UIColor.white,
            colorError:  UIColor.white,
            colorOnPrimary:  UIColor.white,
            colorOnSecondary:  UIColor.white,
            colorOnBackground:  UIColor.white,
            colorOnSurface:  UIColor.white,
            colorOnError:  UIColor.white,
            shapeMedium:  ShapeStyle(cornerRadius: 12, maskedCorners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner])
        )
    }
}

