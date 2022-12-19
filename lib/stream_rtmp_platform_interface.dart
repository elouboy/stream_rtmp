import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'stream_rtmp_method_channel.dart';

abstract class StreamRtmpPlatform extends PlatformInterface {
  /// Constructs a StreamRtmpPlatform.
  StreamRtmpPlatform() : super(token: _token);

  static final Object _token = Object();

  static StreamRtmpPlatform _instance = MethodChannelStreamRtmp();

  /// The default instance of [StreamRtmpPlatform] to use.
  ///
  /// Defaults to [MethodChannelStreamRtmp].
  static StreamRtmpPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StreamRtmpPlatform] when
  /// they register themselves.
  static set instance(StreamRtmpPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
