import UIKit

class ColumnLayout : UICollectionViewFlowLayout{
    
    private var columnNumber : Int = 1
    
    required init(columnNumber : Int) {
        if columnNumber < 0 {
            self.columnNumber = 1
        }else{
            self.columnNumber = columnNumber
        }
        
        super.init()
        self.scrollDirection = .vertical
    }
    
    override convenience init(){
        self.init(columnNumber : 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.size.width / CGFloat(columnNumber)
        self.estimatedItemSize = CGSize(width:availableWidth - minimumInteritemSpacing, height: 0)
    }
}
