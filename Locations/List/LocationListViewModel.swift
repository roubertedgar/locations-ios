import Foundation
import Combine

class LocationListViewModel{
    
    private var bindings = Set<AnyCancellable>()

    @Published private(set) var splits: Array<Location> = Array()
    
    func loadLocations(){
        SplitHttpClient().fetchSplits()
            .sink(receiveCompletion: { _ in
                       print("")
                }, receiveValue: { value in
                    self.splits = value
                }).store(in: &bindings)
    }
}
