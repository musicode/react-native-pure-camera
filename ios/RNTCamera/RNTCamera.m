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

- (void)cameraViewDidCapturePhoto:(CameraViewController *)viewController photoPath:(NSString *)photoPath photoSize:(NSInteger)photoSize photoWidth:(NSInteger)photoWidth photoHeight:(NSInteger)photoHeight {
    [viewController dismissViewControllerAnimated:true completion:nil];
    self.resolve(@{
        @"photo": @{
                @"path": photoPath,
                @"size": @(photoSize),
                @"width": @(photoWidth),
                @"height": @(photoHeight),
        }
    });
}

- (void)cameraViewDidRecordVideo:(CameraViewController *)viewController videoPath:(NSString *)videoPath videoSize:(NSInteger)videoSize videoDuration:(NSInteger)videoDuration photoPath:(NSString *)photoPath photoSize:(NSInteger)photoSize photoWidth:(NSInteger)photoWidth photoHeight:(NSInteger)photoHeight {
    [viewController dismissViewControllerAnimated:true completion:nil];
    self.resolve(@{
        @"video": @{
                @"path": videoPath,
                @"size": @(videoSize),
                @"duration": @(videoDuration),
        },
        @"photo": @{
                @"path": photoPath,
                @"size": @(photoSize),
                @"width": @(photoWidth),
                @"height": @(photoHeight),
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
    
    int videoMinDuration = [RCTConvert int:options[@"videoMinDuration"]];
    if (videoMinDuration > 0) {
        configuration.videoMinDuration = videoMinDuration;
    }
    
    int videoMaxDuration = [RCTConvert int:options[@"videoMaxDuration"]];
    if (videoMaxDuration > 0) {
        configuration.videoMinDuration = videoMaxDuration;
    }

    controller.delegate = self;
    controller.configuration = configuration;

    [controller show];

}

@end
