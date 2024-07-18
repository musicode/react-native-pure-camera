
import UIKit

@objc public protocol CameraViewDelegate {
    
    // 点击退出按钮
    func cameraViewDidExit(_ viewController: CameraViewController)

    // 点击确定按钮选择照片
    func cameraViewDidCapturePhoto(_ viewController: CameraViewController, photo: Photo)
    
    // 点击确定按钮选择视频
    func cameraViewDidRecordVideo(_ viewController: CameraViewController, video: Video, photo: Photo)
    
    // 录制视频时间太短
    func cameraViewDidRecordDurationLessThanMinDuration(_ viewController: CameraViewController)

}
