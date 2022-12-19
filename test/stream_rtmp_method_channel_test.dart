import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stream_rtmp/stream_rtmp_method_channel.dart';

void main() {
  MethodChannelStreamRtmp platform = MethodChannelStreamRtmp();
  const MethodChannel channel = MethodChannel('stream_rtmp');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
