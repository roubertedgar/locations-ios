import UIKit

class LocationViewCell : CollectionViewCell {
    
    static let identifier = "LocationViewCell"
    
    private let cardView = CardView()
    
    var location:Location = Location(id: -1, name: "", review: 0.0, type: ""){
        didSet{
            locationTitle.text = location.name
            locationType.text = location.type
        }
    }
    
    private let locationTitle = Label().apply{ it in
        it.textColor = .black
        it.font = UIFont.boldSystemFont(ofSize: 16)
        it.numberOfLines = 1
    }
    
    private let locationType =  Label().apply{ it in
        it.textColor = .black
        it.font = UIFont.systemFont(ofSize: 14)
    }
    
    private let locationImage = ImageView().apply {it in
        it.backgroundColor = .black
        it.contentMode = .scaleAspectFit
        it.translatesAutoresizingMaskIntoConstraints = false
        it.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(cardView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        cardView.contentView.addSubview(locationImage)
        cardView.contentView.addSubview(locationTitle)
        cardView.contentView.addSubview(locationType)
        cardView.backgroundColor = UIColor.white
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            locationImage.topAnchor.constraint(equalTo: cardView.contentView.topAnchor),
            locationImage.leadingAnchor.constraint(equalTo: cardView.contentView.leadingAnchor),
            locationImage.trailingAnchor.constraint(equalTo: cardView.contentView.trailingAnchor),
            locationImage.heightAnchor.constraint(equalTo: locationImage.widthAnchor, multiplier: 3.0/4.0),
            locationTitle.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 6),
            locationTitle.leadingAnchor.constraint(equalTo: locationImage.leadingAnchor, constant: 8),
            locationTitle.trailingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: -8),
            
            locationType.topAnchor.constraint(equalTo:locationTitle.bottomAnchor, constant: 4),
            locationType.leadingAnchor.constraint(equalTo: locationTitle.leadingAnchor),
            locationType.trailingAnchor.constraint(equalTo: locationTitle.trailingAnchor),
            locationType.bottomAnchor.constraint(lessThanOrEqualTo: cardView.contentView.bottomAnchor, constant: -8)
        ])
    }
    
}
