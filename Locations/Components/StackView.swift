
import UIKit

class StackView : UIStackView{
    
    func didScroll(onScroll : @escaping (CGPoint) -> Void){
        
    }
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isLayoutMarginsRelativeArrangement = true
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
