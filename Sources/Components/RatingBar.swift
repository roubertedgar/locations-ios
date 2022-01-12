import Cosmos
import UIKit

class RatingBar : CosmosView{
    
    init(){
        let settings = CosmosSettings()
        super.init(frame: .zero, settings: settings)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = ""
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
