
import UIKit

class CardView : View {
    
    let contentView = View()
    
    override init(){
        super.init()
        
        self.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 6.0
        contentView.layer.borderWidth = 0.0
        
        layer.masksToBounds = false
        layer.cornerRadius = 6.0
        layer.borderWidth = 0.0
        
        layer.shadowColor = UIColor.lightGray   .cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
