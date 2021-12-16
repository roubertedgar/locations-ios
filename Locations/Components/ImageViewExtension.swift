import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(_ imageUrl : String, placeholder: PlaceHolder? = nil ){
        self.kf.setImage(with: URL(string: imageUrl))
        if let placeholder = placeholder {
            placeholder.applyTo(self)
        }
    }
}

struct PlaceHolder {
    
    private var color: UIColor? = nil
    private var image: UIImage? = nil
    
    init(color: UIColor){
        self.color = color
    }
    
    init(image: UIImage){
        self.image = image
    }
    
    internal func applyTo(_ imageView: UIImageView){
        if(color != nil){
            imageView.backgroundColor = color
        }else{
            imageView.image = image
        }
    }
}
