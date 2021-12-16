import UIKit
import Cosmos

internal class LocationDetailsView {
    
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
    
    let header = StackView().apply { it in
        it.backgroundColor = .blue
        it.layoutMargins = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
        it.spacing = 8
    }
    
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
    private let contentStack = StackView().apply { it in
        it.backgroundColor = .yellow
        it.layoutMargins = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        it.spacing = 16.0
    }
    
    
    
    private func setupContentStack(){
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
        reviews.forEach{ review in
            self.contentStack.addArrangedSubview(
                ReviewCell().apply(closure: { it in it.bind(review)})
            )
        }
    }
    
    private func setupHeaderImageStratch(){
        scrollView.didScroll{ offset in
            let heightOffset = offset.y * -1
            self.imageHeightConstraint.constant = self.imageHeaderHeight + heightOffset
        }
    }
}
