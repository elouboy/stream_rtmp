#import "StreamRtmpPlugin.h"
#if __has_include(<stream_rtmp/stream_rtmp-Swift.h>)
#import <stream_rtmp/stream_rtmp-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "stream_rtmp-Swift.h"
#endif

@implementation StreamRtmpPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStreamRtmpPlugin registerWithRegistrar:registrar];
}
@end
