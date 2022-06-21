import UIKit

class LocationCollectionView {
    
    private var didSelected: (Location)-> Void = {(location) in}
    private let dimens = Dimens.instance
    
    let list : UICollectionView
    let controller: LocationCollectionController
    
    init(){
        let insets = UIEdgeInsets(top: dimens.normal, left: dimens.small, bottom: dimens.tinny, right: dimens.small)
        let columnLayout = ColumnLayoutBuilder()
            .with(columnNumber: 2)
            .with(insets: insets)
            .build()
        
        controller = LocationCollectionController()
        list = UICollectionView(frame: CGRect(), collectionViewLayout: columnLayout)
        
        list.register(LocationViewCell.self, forCellWithReuseIdentifier: LocationViewCell.identifier)
        list.dataSource = controller
        list.delegate = controller
        list.translatesAutoresizingMaskIntoConstraints = false
        
        list.backgroundColor = ThemeManager.shared.theme.colorBackground
    }
    
    
    func loadLocations(_ locations: Array<Location>){
        controller.locations = locations
        list.reloadData()
    }
    
    
    func didSelectLocation(_ action:@escaping (Location)-> Void){
        controller.didSelectSplit(action)
    }
}
