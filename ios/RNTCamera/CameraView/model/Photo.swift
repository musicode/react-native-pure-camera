import Foundation

@objc public class Photo: NSObject {
    
    @objc public var path: String
    @objc public var base64: String
    @objc public var size: Int
    @objc public var width: Int
    @objc public var height: Int
    
    public init(path: String, base64: String, size: Int, width: Int, height: Int) {
        self.path = path
        self.base64 = base64
        self.size = size
        self.width = width
        self.height = height
    }
    
}
