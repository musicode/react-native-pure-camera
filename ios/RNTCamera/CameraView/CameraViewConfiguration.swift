
import UIKit
import AVFoundation

@objc public class CameraViewConfiguration: NSObject {

    // 引导文本颜色
    @objc public var guideLabelTextColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 1)
    
    // 引导文本字体
    @objc public var guideLabelTextFont = UIFont.systemFont(ofSize: 13)
    
    // 引导文本与录制按钮的距离
    @objc public var guideLabelMarginBottom: CGFloat = 30
    
    // 引导文本几秒后淡出
    @objc public var guideLabelFadeOutDelay: TimeInterval = 3
    
    // 引导文本
    @objc public var guideLabelTitle = ""
    
    
    
    // 录制按钮默认半径
    @objc public var captureButtonCenterRadiusNormal: CGFloat = 36
    
    // 录制按钮录制视频时的半径
    @objc public var captureButtonCenterRadiusRecording: CGFloat = 24
    
    // 录制按钮中心圆的默认颜色
    @objc public var captureButtonCenterColorNormal = UIColor.white
    
    // 录制按钮按下时中心圆的颜色
    @objc public var captureButtonCenterColorPressed = UIColor(red: 240 / 255, green: 240 / 255, blue: 240 / 255, alpha: 1)
    
    // 录制按钮默认的圆环大小
    @objc public var captureButtonRingWidthNormal: CGFloat = 6
    
    // 录制按钮录制时的圆环大小
    @objc public var captureButtonRingWidthRecording: CGFloat = 30
    
    // 录制按钮圆环颜色
    @objc public var captureButtonRingColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 0.9)
    
    // 录制按钮进度条轨道的大小
    @objc public var captureButtonTrackWidth: CGFloat = 4
    
    // 录制按钮进度条轨道的颜色
    @objc public var captureButtonTrackColor = UIColor(red: 0.11, green: 0.64, blue: 0.06, alpha: 0.9)
    
    // 录制按钮与底边的距离
    @objc public var captureButtonMarginBottom: CGFloat = 60
    
    
    // 切换摄像头按钮与顶边的距离
    @objc public var flipButtonMarginTop: CGFloat = 40
    
    // 切换摄像头按钮与右边的距离
    @objc public var flipButtonMarginRight: CGFloat = 20
    
    // 切换摄像头按钮的宽度
    @objc public var flipButtonWidth: CGFloat = 50
    
    // 切换摄像头按钮的高度
    @objc public var flipButtonHeight: CGFloat = 44
    
    // 切换摄像头按钮的图片
    @objc public var flipButtonImage = UIImage(named: "camera_view_camera_flip")
    
    // 闪光灯按钮与切换摄像头按钮的距离
    @objc public var flashButtonMarginRight: CGFloat = 14
    
    // 闪光灯按钮的宽度
    @objc public var flashButtonWidth: CGFloat = 50
    
    // 闪光灯按钮的高度
    @objc public var flashButtonHeight: CGFloat = 44
    
    // 闪光灯开启的图片
    @objc public var flashOnImage = UIImage(named: "camera_view_flash_on")
    
    // 闪光灯关闭的图片
    @objc public var flashOffImage = UIImage(named: "camera_view_flash_off")
    
    // 闪光灯自动的图片
    @objc public var flashAutoImage = UIImage(named: "camera_view_flash_auto")
    
    // 退出按钮与录制按钮的距离
    @objc public var exitButtonMarginRight: CGFloat = 50
    
    // 退出按钮的宽度
    @objc public var exitButtonWidth: CGFloat = 50
    
    // 退出按钮的高度
    @objc public var exitButtonHeight: CGFloat = 44
    
    // 退出按钮的图片
    @objc public var exitButtonImage = UIImage(named: "camera_view_exit")
    
    // 确定按钮的半径
    @objc public var submitButtonCenterRadius: CGFloat = 38
    
    // 确定按钮的颜色
    @objc public var submitButtonCenterColor = UIColor.white
    
    // 确定按钮的图片
    @objc public var submitButtonImage = UIImage(named: "camera_view_submit")
    
    // 取消按钮的半径
    @objc public var cancelButtonCenterRadius: CGFloat = 38
    
    // 取消按钮的颜色
    @objc public var cancelButtonCenterColor = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.9)
    
    // 取消按钮的图片
    @objc public var cancelButtonImage = UIImage(named: "camera_view_cancel")
    
    
    // 聚焦视图的宽度
    @objc public var focusViewWidth: CGFloat = 60
    
    // 聚焦视图的高度
    @objc public var focusViewHeight: CGFloat = 60
    
    // 聚焦视图的颜色
    @objc public var focusViewColor = UIColor.green
    
    // 聚焦视图的粗细
    @objc public var focusViewThickness: CGFloat = 1 / UIScreen.main.scale
    
    @objc public var focusViewCrossLength: CGFloat = 6
    
    // 图片保存的目录
    @objc public var photoDir = NSTemporaryDirectory()
    
    // 图片是否需要返回 base64
    @objc public var photoBase64Enabled = false
    
    // 视频保存的目录
    @objc public var videoDir = NSTemporaryDirectory()

    // 视频质量
    @objc public var videoQuality = VideoQuality.p720
    
    // 视频最短录制时长，单位是毫秒
    @objc public var videoMinDuration: Int = 1000
    
    // 视频最大录制时长，单位是毫秒
    @objc public var videoMaxDuration: Int = 10000
    
    // 拍摄模式
    @objc public var captureMode = CaptureMode.photo_video
    
    public override init() {

    }
    
}
