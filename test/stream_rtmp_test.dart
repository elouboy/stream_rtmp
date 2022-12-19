import 'package:flutter_test/flutter_test.dart';
import 'package:stream_rtmp/stream_rtmp.dart';
import 'package:stream_rtmp/stream_rtmp_platform_interface.dart';
import 'package:stream_rtmp/stream_rtmp_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStreamRtmpPlatform
    with MockPlatformInterfaceMixin
    implements StreamRtmpPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final StreamRtmpPlatform initialPlatform = StreamRtmpPlatform.instance;

  test('$MethodChannelStreamRtmp is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStreamRtmp>());
  });

  test('getPlatformVersion', () async {
    MockStreamRtmpPlatform fakePlatform = MockStreamRtmpPlatform();
    StreamRtmpPlatform.instance = fakePlatform;

    expect(await fakePlatform.getPlatformVersion(), '42');
  });
}
