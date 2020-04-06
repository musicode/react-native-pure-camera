#import <React/RCTBridgeModule.h>

@interface RNTCamera : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTPromiseResolveBlock resolve;
@property (nonatomic, strong) RCTPromiseRejectBlock reject;

@end
