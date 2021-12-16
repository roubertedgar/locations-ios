import UIKit
import Combine

class LocationListViewController: UIViewController {
    
    
    private let viewModel = LocationListViewModel()
    private var bindings = Set<AnyCancellable>()
    
    private var locationCollectionController = LocationCollectionController()
    private var locationCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: ColumnLayout())
    
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

