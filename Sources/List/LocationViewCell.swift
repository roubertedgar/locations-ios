import UIKit

class LocationViewCell : CollectionViewCell {
    
    static let identifier = "LocationViewCell"
    
    var location:Location = Location(id: -1, name: "", review: 0.0, type: ""){
        didSet{
            locationTitle.text = location.name
            locationType.text = location.type
        }
    }
    
    private let locationTitle: UILabel = {
      let label = Label()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let locationType: UILabel = {
        let label = Label()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let locationImage: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(locationImage)
        contentView.addSubview(locationTitle)
        contentView.addSubview(locationType)
        contentView.backgroundColor = .blue
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            locationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            locationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            locationImage.heightAnchor.constraint(equalTo: locationImage.widthAnchor, multiplier: 3.0/4.0),
            locationTitle.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 6),
            locationTitle.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor, constant: 8),
            locationTitle.trailingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: -8),
            
            locationType.topAnchor.constraint(equalTo:locationTitle.bottomAnchor, constant: 4),
            locationType.leadingAnchor.constraint(equalTo: locationTitle.leadingAnchor),
            locationType.trailingAnchor.constraint(equalTo: locationTitle.trailingAnchor),
            locationType.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
