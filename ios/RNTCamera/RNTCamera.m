#import "RNTCamera.h"
#import <React/RCTConvert.h>
#import "react_native_pure_camera-Swift.h"

@interface RNTCamera()<CameraViewDelegate>

@end

@implementation RNTCamera

- (void)cameraViewDidExit:(CameraViewController *)viewController {
    [viewController dismissViewControllerAnimated:true completion:nil];
    self.reject(@"-1", @"cancel", nil);
}

- (void)cameraViewDidRecordDurationLessThanMinDuration:(CameraViewController *)viewController {
    
}

- (void)cameraViewDidCapturePhoto:(CameraViewController *)viewController photo:(Photo *)photo {
    [viewController dismissViewControllerAnimated:true completion:nil];
    self.resolve(@{
        @"photo": @{
            @"path": photo.path,
            @"base64": photo.base64,
            @"size": @(photo.size),
            @"width": @(photo.width),
            @"height": @(photo.height),
        }
    });
}

- (void)cameraViewDidRecordVideo:(CameraViewController *)viewController video:(Video *)video photo:(Photo *)photo {
    [viewController dismissViewControllerAnimated:true completion:nil];
    self.resolve(@{
        @"video": @{
                @"path": video.path,
                @"size": @(video.size),
                @"duration": @(video.duration),
        },
        @"photo": @{
            @"path": photo.path,
            @"base64": photo.base64,
            @"size": @(photo.size),
            @"width": @(photo.width),
            @"height": @(photo.height),
        }
    });
}

RCT_EXPORT_MODULE(RNTCamera);

RCT_EXPORT_METHOD(open:(NSDictionary*)options
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {

    self.resolve = resolve;
    self.reject = reject;

    CameraViewController *controller = [CameraViewController new];

    CameraViewConfiguration *configuration = [CameraViewConfiguration new];

    NSString *captureMode = [RCTConvert NSString:options[@"captureMode"]];
    if (captureMode != nil) {
        if ([captureMode isEqualToString:@"photo"]) {
            configuration.captureMode = CaptureModePhoto;
        }
        else if ([captureMode isEqualToString:@"video"]) {
            configuration.captureMode = CaptureModeVideo;
        }
        else {
            configuration.captureMode = CaptureModePhoto_video;
        }
    }
    
    NSString *guideLabelTitle = [RCTConvert NSString:options[@"guideLabelTitle"]];
    if (guideLabelTitle != nil) {
        configuration.guideLabelTitle = guideLabelTitle;
    }
    
    configuration.photoBase64Enabled = [RCTConvert BOOL:options[@"photoBase64Enabled"]];
    
    int videoMinDuration = [RCTConvert int:options[@"videoMinDuration"]];
    if (videoMinDuration > 0) {
        configuration.videoMinDuration = videoMinDuration;
    }
    
    int videoMaxDuration = [RCTConvert int:options[@"videoMaxDuration"]];
    if (videoMaxDuration > 0) {
        configuration.videoMaxDuration = videoMaxDuration;
    }

    controller.delegate = self;
    controller.configuration = configuration;

    [controller show];

}

@end
