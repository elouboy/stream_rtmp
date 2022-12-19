import Flutter
import Foundation
import LFLiveKit

private var session: LFLiveSession?


// Swift code for iOS (continued)
public class RTMPFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "stream_rtmp", binaryMessenger: registrar.messenger())
    let instance = StreamRtmp()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if (call.method == "startStream") {
      guard let url = call.arguments as? String else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Invalid argument", details: nil))
        return
      }
      startStream(url: url)
      result(nil)
    } else if (call.method == "stopStream") {
      stopStream()
      result(nil)
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func startStream(url: String) {
    let stream = LFLiveStreamInfo()
    stream.url = url
    session = LFLiveSession(audioConfiguration: LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.high), videoConfiguration: LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.low3))
    session?.delegate = self
    session?.captureDevicePosition = .back
    session?.running = true
    session?.startLive(stream)
  }

  private func stopStream() {
    session?.stopLive()
    session = nil


  }
}

