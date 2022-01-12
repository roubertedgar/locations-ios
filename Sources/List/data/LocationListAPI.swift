import Foundation
import Combine

class LocationListAPI {
    
    private let httpClient : HttpClient
    
    init(httpClient: HttpClient){
        self.httpClient = httpClient
    }
    
    func fetchLocations() ->  AnyPublisher<Array<Location>, Error>{
        
        httpClient.get(path: "/locations").publishString().tryMap{ response in
            switch response.result {
            case let .success(data):
                return self.parseResult(data)
            case let .failure(error):
                throw error
            }
        }.eraseToAnyPublisher()
    }
    
    private func parseResult(_ json : String) -> Array<Location>{
        
        let jsonData = json.data(using: .utf8)
        let locationListRemote =  try! JSONDecoder().decode(LocationListRemoteEntity.self, from: jsonData!)
        
        return locationListRemote.locations.map{
            LocationRemoteEntity.toDomain($0)
        }
    }
}
