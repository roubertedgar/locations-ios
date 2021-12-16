import UIKit
import Cosmos

class ReviewCell : View {
    
    private let profilePicture = ImageView().apply { it in
        it.loadImage("", placeholder: PlaceHolder(color: .blue))
    }
    
    let stars = RatingBar().apply { it in
        it.rating = 4
        it.settings.updateOnTouch = false
        it.text = ""
    }
    
    private let title = Label().apply{ it in
        it.text = "Tite"
    }
    
    private let review = Label().apply { it in
        it.text = "Review blabla"
    }
    
    private let author = Label().apply { it in
        it.text = "Edgar de Sousa from Brazil"
    }
    
    override init(){
        super.init()
        addSubview(profilePicture)
        addSubview(stars)
        addSubview(title)
        addSubview(review)
        addSubview(author)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: 70),
            profilePicture.heightAnchor.constraint(equalTo: profilePicture.widthAnchor, multiplier: 1),

            stars.topAnchor.constraint(equalTo: profilePicture.topAnchor),
            stars.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 16),
            stars.trailingAnchor.constraint(equalTo: trailingAnchor),
        
            title.topAnchor.constraint(equalTo: stars.bottomAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            
            review.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
            review.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            review.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            
            author.topAnchor.constraint(equalTo: review.bottomAnchor, constant: 8),
            author.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            author.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            author.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
        ])
    }
    
    func bind(_ review : Review){
        title.text = review.author
    }
}
