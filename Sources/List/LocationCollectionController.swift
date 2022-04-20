import UIKit

class LocationCollectionController:NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var splits: [Location] = Array()
    private var didSelected: (Location)-> Void = {(split) in}
    
    func didSelectSplit(_ didSelected:@escaping (Location)-> Void){
        self.didSelected = didSelected
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelected(splits[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return splits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationViewCell.identifier, for: indexPath) as! LocationViewCell
        
        let location = splits[indexPath.row]
        cell.location = location
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
//        }
}
