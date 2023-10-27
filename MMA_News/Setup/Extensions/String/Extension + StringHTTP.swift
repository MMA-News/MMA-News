
import Foundation

//MARK: - Others
extension String {
   
   static func format(_ format: Format) -> String {
      return format.rawValue
   }
   static func method(_ method: HTTPMethod) -> String {
      return method.rawValue
   }
   enum Format: String {
      case two = "%02d:%02d"
   }
   enum HTTPMethod : String {
      case post  = "POST"
      case get   = "GET"
      case patch = "PATCH"
      case put   = "PUT"
   }
}

