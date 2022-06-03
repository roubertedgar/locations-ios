import UIKit
import SwiftUI

class ColumnLayout : UICollectionViewFlowLayout{
    
    var columnNumber : Int = 1
    var insets = UIEdgeInsets()
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        var bounds = 0.0
        
        collectionView.contentInset = insets
        
        let contentBounds = insets.right + insets.right/CGFloat(columnNumber)
        if(contentBounds > 0.0) {bounds = contentBounds} else {bounds = minimumInteritemSpacing}
        let availableWidth = collectionView.bounds.size.width / CGFloat(columnNumber) - (bounds + 0.1)
        
        self.estimatedItemSize = CGSize(width: availableWidth , height: 0)
    }
}

protocol Builder {
    associatedtype Builded
    
    func build() -> Builded
}

class ColumnLayoutBuilder : Builder {
   
    typealias Builded = ColumnLayout
    
    private var columnNumber = 1
    private var insets = UIEdgeInsets()
    private var lineSpacing = CGFloat(Dimens.instance.small)
    
    func with(columnNumber: Int) -> ColumnLayoutBuilder {
        self.columnNumber = columnNumber
        return self
    }
    
    func with(insets: UIEdgeInsets) -> ColumnLayoutBuilder {
        self.insets = insets
        return self
    }
    
    func with(lineSpacing: CGFloat) -> ColumnLayoutBuilder {
        self.lineSpacing = lineSpacing
        return self
    }
    
    func build() -> ColumnLayout {
         return ColumnLayout().apply(closure: { it in
             it.insets = insets
             it.columnNumber = columnNumber
             it.minimumLineSpacing = lineSpacing
         })
    }
}
