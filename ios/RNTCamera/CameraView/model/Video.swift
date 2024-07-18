import Foundation

@objc public class Video: NSObject {
    
    public var path: String
    public var size: Int
    public var duration: Int
    
    public init(path: String, size: Int, duration: Int) {
        self.path = path
        self.size = size
        self.duration = duration
    }
    
}
