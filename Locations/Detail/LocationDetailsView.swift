import UIKit
import Cosmos

internal class LocationDetailsView: View {
    
    private var view : UIView = UIView()
    
    func load(view: UIView){
        self.view = view
        setupView()
        setupImage()
        setupHeader()
        setupScrollView()
        setupContentStack()
        setupHeaderImageStratch()
    }
    
    private var imageHeightConstraint = NSLayoutConstraint()
    private let imageHeaderHeight = 200.0
    
    let image = ImageView().apply { it in
        it.contentMode = .scaleAspectFill
        it.clipsToBounds = true
    }
    
    let header = StackView()
    
    let titleTextView = Label().apply { it in
        it.text = "Opa Bichão"
    }
    
    let ratingSarts = CosmosView().apply { it in
        it.rating = 4
        it.settings.updateOnTouch = false
        it.text = "4.0"
    }
    
    private func setupView(){
        view.addSubview(image)
        view.addSubview(header)
        view.addSubview(scrollView)
    }
    
    private func setupImage(){
        imageHeightConstraint = image.heightAnchor.constraint(equalToConstant: imageHeaderHeight)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageHeightConstraint
        ])
    }
    
    private func setupHeader(){
        header.backgroundColor = .blue
        header.layoutMargins = UIEdgeInsets(top: dimens.small, left: dimens.normal, bottom: dimens.small, right: dimens.normal)
        header.spacing = dimens.small
        header.addArrangedSubview(titleTextView)
        header.addArrangedSubview(ratingSarts)
        
        NSLayoutConstraint.activate([
            header.heightAnchor.constraint(equalToConstant: 100.0),
            header.topAnchor.constraint(equalTo: image.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: image.trailingAnchor)
        ])
    }
    
    //MARK: Scroll setup
    private let scrollView = ScrollView().apply { it in
        it.backgroundColor = .red
        it.bounces = false
        it.isPagingEnabled = false
    }
    
    private let contentView = View() .apply { it in
        it.backgroundColor = .yellow
    }
    
    private func setupScrollView(){
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: header.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        contentStack.addArrangedSubview(Label().apply { it in it.text = "Sobre"})
        contentStack.addArrangedSubview(aboutText)
        contentStack.addArrangedSubview(locationDetailInfo)
        contentStack.addArrangedSubview(Label().apply { it in it.text = "Review"})
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
    
    private func setupHeaderImageStratch(){
        scrollView.didScroll{ offset in
            let heightOffset = offset.y * -1
            self.imageHeightConstraint.constant = self.imageHeaderHeight + heightOffset
        }
    }
}
