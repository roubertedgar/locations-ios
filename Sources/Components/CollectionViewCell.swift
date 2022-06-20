import UIKit
import SwiftUI

class CollectionViewCell : UICollectionViewCell {
    
    var widthConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    
        widthConstraint = contentView.widthAnchor.constraint(equalToConstant: 200)
        widthConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let width = layoutAttributes.size.width
        widthConstraint.constant = width
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
        
        layoutAttributes.size = contentView.frame.size
        return super.preferredLayoutAttributesFitting(layoutAttributes)
    }
}

