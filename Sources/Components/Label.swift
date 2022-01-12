import UIKit

class Label : UILabel {
    
    @IBInspectable
    var localizedText: String = "" {
        didSet {
            self.text = getString(localizedText)
        }
    }
    
    init(){
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension Label {
    func setIcon(_ icon: UIImage, x: Double = 0, y: Double = -1){
        let iconHeight = (font.capHeight - font.lineHeight) / 2
        let iconAttatch =  NSTextAttachment(image: icon)
        iconAttatch.bounds = CGRect(x: 0, y: iconHeight + y, width: self.font.lineHeight + 2.0, height: self.font.lineHeight + 2.0)
        
        let iconedText = NSMutableAttributedString(attachment: iconAttatch)
        iconedText.append(NSMutableAttributedString(string: self.text ?? ""))
        attributedText = iconedText
    }
}
