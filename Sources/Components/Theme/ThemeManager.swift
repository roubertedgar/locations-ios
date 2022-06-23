import SwiftUI

class ThemeManager {
    @Environment(\.colorScheme) private var colorScheme : ColorScheme
    
    static var shared: ThemeManager = ThemeManager()
    
    var darkTheme: Theme
    var lightTheme: Theme
    var theme: Theme {
        get{
            return colorScheme == .dark ? darkTheme : lightTheme
        }
    }
    
    private init(){
        lightTheme = AppTheme()
        darkTheme = lightTheme
    }
    
    func setTheme(_ theme : Theme){
        self.lightTheme = theme
    }
    
    func setDarkTheme(_ theme: Theme){
        self.darkTheme = theme
    }
}
