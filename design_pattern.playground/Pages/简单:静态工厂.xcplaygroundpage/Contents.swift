import Foundation

enum SimpleType {
    case one
    case two
}

class SimpleFactory {
    func create(_ type: SimpleType) -> Any {
        switch type {
        case .one:
            return NSObject()
        case .two:
            return NSObject()
        }
    }
    
    static func create(_ type: SimpleType) -> Any {
        switch type {
        case .one:
            return NSObject()
        case .two:
            return NSObject()
        }
    }
}

print(SimpleFactory().create(.one))
print(SimpleFactory.create(.one))
