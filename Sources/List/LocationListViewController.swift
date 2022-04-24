import UIKit
import Combine
import SwiftUI

class LocationListViewController: ViewController {
    
    private var bindings = Set<AnyCancellable>()
    private let viewModel : LocationListViewModel
    
    private let locationCollectionView = LocationCollectionView()
    
    required init(viewModel : LocationListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupObservers()
        viewModel.loadLocations()
    }
    
    private func setupViews(){
        view.addSubview(locationCollectionView.list)
        NSLayoutConstraint.activate([
            locationCollectionView.list.topAnchor.constraint(equalTo: view.topAnchor),
            locationCollectionView.list.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            locationCollectionView.list.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            locationCollectionView.list.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupObservers(){
        viewModel.$splits
            .sink(receiveValue: {splits in
                self.onLoadSplits(splits)
            }).store(in: &bindings)
        
        locationCollectionView.didSelectLocation { location in
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationController?.pushViewController(LocationDetailsViewController(), animated: true)
        }
    }
    
    private func onLoadSplits(_ splits: [Location]) {
        locationCollectionView.loadLocations(splits)
    }
}

