import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'stream_rtmp_platform_interface.dart';

/// An implementation of [StreamRtmpPlatform] that uses method channels.
class MethodChannelStreamRtmp extends StreamRtmpPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('stream_rtmp');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
