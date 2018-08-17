#import "SettingsPlugin.h"

@implementation SettingsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.ly.com/settings"
            binaryMessenger:[registrar messenger]];
  SettingsPlugin* instance = [[SettingsPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"wifi" isEqualToString:call.method]) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    result(@YES);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
