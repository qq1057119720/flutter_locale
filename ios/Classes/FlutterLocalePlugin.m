#import "FlutterLocalePlugin.h"

@implementation FlutterLocalePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_locale"
            binaryMessenger:[registrar messenger]];
  FlutterLocalePlugin* instance = [[FlutterLocalePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"getSystemLocale" isEqualToString:call.method]) {
      NSString *identifier = [[NSLocale currentLocale] localeIdentifier];
      result(identifier);
    } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
