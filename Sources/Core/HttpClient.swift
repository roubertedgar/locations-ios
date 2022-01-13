import Alamofire
import Foundation

public class HttpClient {
    
    private let session : Session
    private let baseUrl : String
    
    fileprivate init(baseUrl: String , session : Session){
        self.baseUrl = baseUrl
        self.session = session
    }
    
    func get(path: String, headers: HTTPHeaders = []) -> DataRequest {
        return session.request(parseUrl(path), method: .get, headers: headers)
    }
    
    func parseUrl(_ path: String) -> String {
        return "\(baseUrl)\(path)"
    }
    
    class Builder {
        private var baseUrl : String = ""
        private var interceptors : [Interceptor] = []
        private var requestTimeout = TimeInterval(30)
        private var resourceTimeout = TimeInterval(30)
        
        init(baseUrl : String){
            self.baseUrl = baseUrl
        }
        
        func withInterceptor(interceptor: Interceptor){
            interceptors.append(interceptor)
        }
        
        func build() -> HttpClient {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = requestTimeout
            configuration.timeoutIntervalForResource = resourceTimeout
            let session  = Session(configuration: configuration, interceptor: Interceptor(adapters: [], retriers: [], interceptors: interceptors))
            
            return HttpClient(baseUrl: baseUrl, session: session)
        }
    }
}
