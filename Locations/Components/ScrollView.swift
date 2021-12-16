import UIKit

class ScrollView : UIScrollView, UIScrollViewDelegate{
    
    var onScroll : (CGPoint)-> Void = {(offset) in}
    
    func didScroll(onScroll : @escaping (CGPoint) -> Void){
        self.onScroll = onScroll
    }
    
    init(){
        super.init(frame: .zero)
        self.delegate = self
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        onScroll(scrollView.contentOffset)
    }
}
