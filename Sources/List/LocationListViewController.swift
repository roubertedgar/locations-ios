import UIKit
import Combine

class LocationListViewController: ViewController {
    
    private let viewModel : LocationListViewModel
    
    private var bindings = Set<AnyCancellable>()
    
    private let locationCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: ColumnLayout(columnNumber: 2, insets: UIEdgeInsets(top: Dimens.instance.normal, left: Dimens.instance.small, bottom: Dimens.instance.tinny, right: Dimens.instance.small)))
    private var locationCollectionController = LocationCollectionController()
    
    required init(viewModel : LocationListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
        viewModel.loadLocations()
    }
    
    private func setupObservers(){
        viewModel.$splits
            .sink(receiveValue: {splits in
                self.onLoadSplits(splits)
            }).store(in: &bindings)
        
        locationCollectionController.didSelectSplit { location in
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.pushViewController(LocationDetailsViewController(), animated: true)
        }
    }
    
    private func onLoadSplits(_ splits: [Location]) {
        locationCollectionController.splits = splits
        locationCollectionView.reloadData()
    }
}

extension LocationListViewController{
    
    override func loadView() {
        super.loadView()
        
        locationCollectionView.register(LocationViewCell.self, forCellWithReuseIdentifier: LocationViewCell.identifier)
        locationCollectionView.dataSource = locationCollectionController
        locationCollectionView.delegate = locationCollectionController
        locationCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(locationCollectionView)
        NSLayoutConstraint.activate([
            locationCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            locationCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            locationCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

