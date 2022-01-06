import UIKit
import Cosmos
import QuartzCore

class ReviewCell : View {
    
    private let profilePicture = ImageView().apply { it in
        it.loadImage("", placeholder: PlaceHolder(color: .blue))
        it.layer.cornerRadius = Dimens.instance.reviewPictureWidth / 2.0
        it.clipsToBounds = true
    }
    
    let stars = RatingBar().apply {
        $0.settings.updateOnTouch = false
        $0.text = ""
    }
    
    private let title = Label()
    private let review = Label()
    private let author = Label()
    
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
            profilePicture.topAnchor.constraint(equalTo: topAnchor),
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor),
            profilePicture.widthAnchor.constraint(equalToConstant: dimens.reviewPictureWidth),
            profilePicture.heightAnchor.constraint(equalTo: profilePicture.widthAnchor, multiplier: 1),
            
            stars.topAnchor.constraint(equalTo: profilePicture.topAnchor),
            stars.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: dimens.small),
            stars.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            title.topAnchor.constraint(equalTo: stars.bottomAnchor, constant: dimens.tinny),
            title.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            
            review.topAnchor.constraint(equalTo: title.bottomAnchor, constant: dimens.tinny),
            review.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            review.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            
            author.topAnchor.constraint(equalTo: review.bottomAnchor, constant: dimens.tinny),
            author.leadingAnchor.constraint(equalTo: stars.leadingAnchor),
            author.trailingAnchor.constraint(equalTo: stars.trailingAnchor),
            author.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func bind(_ reviewItem : Review){
        stars.rating = reviewItem.rating
        title.text = reviewItem.author
        review.text = reviewItem.review
        author.text = reviewItem.author
    }
}
