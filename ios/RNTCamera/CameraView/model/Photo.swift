import Foundation

@objc public class Photo: NSObject {
    
    public var path: String
    public var base64: String
    public var size: Int
    public var width: Int
    public var height: Int
    
    public init(path: String, base64: String, size: Int, width: Int, height: Int) {
        self.path = path
        self.base64 = base64
        self.size = size
        self.width = width
        self.height = height
    }
    
}
