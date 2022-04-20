import UIKit

class ColumnLayout : UICollectionViewFlowLayout{
    
    private var columnNumber : Int = 1
    private var insets = UIEdgeInsets()
    
    required init(columnNumber : Int, insets: UIEdgeInsets) {
        if columnNumber < 0 {
            self.columnNumber = 1
        }else{
            self.columnNumber = columnNumber
        }
        
        self.insets = insets
        
        super.init()
        self.scrollDirection = .vertical
    }
    
     convenience init(columnNumber : Int) {
        self.init(columnNumber: columnNumber, insets: UIEdgeInsets())
    }
    
     convenience init(insets : UIEdgeInsets) {
        self.init(columnNumber: 1, insets: UIEdgeInsets())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        var bounds = 0.0
        
        collectionView.contentInset = insets
        
        let contentBounds = insets.right + insets.right/2
        if(contentBounds > 0.0) {bounds = contentBounds} else {bounds = minimumInteritemSpacing}
        let availableWidth = collectionView.bounds.size.width / CGFloat(columnNumber) - bounds
        
        self.estimatedItemSize = CGSize(width: availableWidth , height: 0)
    }
}
