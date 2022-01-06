import UIKit
import Cosmos

internal class LocationDetailsView: View {
    
    override init(){
        super.init()
        setupView()
        setupImage()
        setupHeader()
        setupScrollView()
        setupContentStack()
        setupHeaderImageStratch()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var imageHeightConstraint = NSLayoutConstraint()
    
    let image = ImageView().apply { it in
        it.contentMode = .scaleAspectFill
        it.clipsToBounds = true
    }
    
    let imageCover = View().apply { it in
        it.backgroundColor = .blue
        it.alpha = 0
    }
    
    let header = View()
    
    private let scrollView = ScrollView().apply { it in
        it.backgroundColor = .red
        it.bounces = false
        it.isPagingEnabled = false
    }
    
    private func setupView(){
        addSubview(image)
        addSubview(imageCover)
        addSubview(header)
        addSubview(scrollView)
    }
    
    let titleTextView = Label().apply { it in
        it.text = "Opa Bichão"
    }
    
    let ratingSarts = RatingBar().apply { it in
        it.rating = 4
        it.settings.updateOnTouch = false
        it.text = "4.0"
    }
    
    private func setupImage(){
        imageHeightConstraint = image.heightAnchor.constraint(equalToConstant: dimens.headerImageHeight)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageHeightConstraint,
            
            imageCover.topAnchor.constraint(equalTo: image.topAnchor),
            imageCover.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            imageCover.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            imageCover.bottomAnchor.constraint(equalTo: image.bottomAnchor)
        ])
    }
    
    private func setupHeader(){
        header.backgroundColor = .blue
        header.addSubview(titleTextView)
        header.addSubview(ratingSarts)
        
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: image.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: leadingAnchor),
            header.trailingAnchor.constraint(equalTo: trailingAnchor),
            header.bottomAnchor.constraint(equalTo: ratingSarts.bottomAnchor, constant: dimens.normal),
            
            titleTextView.topAnchor.constraint(equalTo: header.topAnchor, constant: dimens.normal),
            titleTextView.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: dimens.normal),
            titleTextView.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: dimens.normal),
            
            ratingSarts.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: dimens.small),
            ratingSarts.leadingAnchor.constraint(equalTo: titleTextView.leadingAnchor)
        ])
    }
    
    //MARK: Scroll setup
    private let contentView = View() .apply { it in
        it.backgroundColor = .yellow
    }
    
    private func setupScrollView(){
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: header.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    //MARK: ContentStack Setup
    private let contentStack = StackView()
    
    private func setupContentStack(){
        contentStack.backgroundColor = .yellow
        contentStack.layoutMargins = UIEdgeInsets(top: dimens.tinny, left: dimens.normal, bottom: dimens.tinny, right: dimens.normal)
        contentStack.spacing = dimens.large
        
        contentView.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        setupContent()
    }
    
    let aboutText = Label()
    let locationDetailInfo = LocationInfoView()
    var reviews : Array<Review> = [] {
        didSet {updateReviews(reviews)}
    }
    
    private func setupContent(){
        contentStack.addArrangedSubview(Label().apply { $0.localizedText = "about_label"})
        contentStack.addArrangedSubview(aboutText)
        contentStack.addArrangedSubview(locationDetailInfo)
        contentStack.addArrangedSubview(Label().apply { it in it.localizedText = "review_label"})
    }
    
    private func updateReviews(_ reviews : Array<Review>){
        var lastReview : UIView = View()
        
        reviews.forEach{ review in
            lastReview = ReviewCell().apply(closure: { it in it.bind(review)})
            self.contentStack.addArrangedSubview(lastReview)
        }
        
        contentStack.setCustomSpacing(40, after: lastReview)
        contentStack.addArrangedSubview(
            Button().apply{ it in
                it.setTitleColor(.black, for: .normal)
                it.localizedTitle = "location_details_see_all_reviews"
                it.contentHorizontalAlignment = .trailing
            }
        )
    }
    
    var topbarHeight : CGFloat = 0.0
    
    private func setupHeaderImageStratch(){
        scrollView.didScroll{ self.onScroll($0)}
    }
    
    private func onScroll(_ offset: CGPoint){
        let heightOffset = dimens.headerImageHeight + (offset.y * -1)
        
        let alpha = 1 - 0.025 * (heightOffset - self.topbarHeight)
        let height = max(self.topbarHeight, heightOffset)
        
        imageCover.alpha = alpha
        imageHeightConstraint.constant = height
        
    }
}
