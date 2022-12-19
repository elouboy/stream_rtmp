package com.example.stream_rtmp

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** StreamRtmp */
class StreamRtmp: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "stream_rtmp")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  // Kotlin code for Android
private fun startStream(url: String) {
  val rtmpCamera1 = RtmpCamera1()
  rtmpCamera1.setVideoSource(VideoSource.CAMERA)
  rtmpCamera1.setOutputFormat(OutputFormat.MPEG_4)
  rtmpCamera1.setAudioEncoder(AudioEncoder.AAC)
  rtmpCamera1.setVideoEncoder(VideoEncoder.H264)
  rtmpCamera1.setVideoSize(640, 480)
  rtmpCamera1.setVideoFrameRate(30)
  rtmpCamera1.setVideoBitrate(500 * 1000)
  rtmpCamera1.setAudioBitrate(64 * 1000)
  rtmpCamera1.setSwEnabled(true)
  rtmpCamera1.setSwSize(640, 480)
  rtmpCamera1.setPortrait(false)
  rtmpCamera1.setPreviewOrientation(0)
  rtmpCamera1.start(url)
}

private fun stopStream() {
  rtmpCamera1.stop()
}

}
