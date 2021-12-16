import UIKit

protocol ScopeFunctionsProtocol{}

extension ScopeFunctionsProtocol{
    @inline(__always) func apply(closure : (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}

extension NSObject : ScopeFunctionsProtocol {}
