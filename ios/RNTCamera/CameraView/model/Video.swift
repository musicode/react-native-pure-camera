import Foundation

@objc public class Video: NSObject {
    
    @objc public var path: String
    @objc public var size: Int
    @objc public var duration: Int
    
    public init(path: String, size: Int, duration: Int) {
        self.path = path
        self.size = size
        self.duration = duration
    }
    
}
