import Foundation

enum Routes { 
    case content
    case patientList
    case none
}

extension Routes: Equatable, Hashable {
    static func == (lhs: Routes, rhs: Routes) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        
        switch self {
        default:
            hasher.combine("\(self)")
        }
    }
}
