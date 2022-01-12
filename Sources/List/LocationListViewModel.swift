import Foundation
import Combine

class LocationListViewModel{
    
    private var bindings = Set<AnyCancellable>()
    
    private let locationListAPI : LocationListAPI
    
    init(locationListAPI : LocationListAPI){
        self.locationListAPI = locationListAPI
    }

    @Published private(set) var splits: Array<Location> = Array()
    
    func loadLocations(){
        locationListAPI.fetchLocations()
            .sink(receiveCompletion: { _ in
                       print("")
                }, receiveValue: { value in
                    self.splits = value
                }).store(in: &bindings)
    }
}
