import 'stream_rtmp_platform_interface.dart';
import 'package:flutter/services.dart';

class StreamRtmpPlugin {
  static const MethodChannel _channel = MethodChannel('stream_rtmp');

  static Future<void> startStream(String url) async {
    await _channel.invokeMethod('startStream', url);
  }

  static Future<void> stopStream() async {
    await _channel.invokeMethod('stopStream');
  }
}
