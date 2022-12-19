# Stream RTMP Plugin for Flutter

A Flutter plugin for streaming RTMP on Android and iOS.


## Usage


To use this plugin, add stream_rtmp as a dependency in your pubspec.yaml file.


#### Configuration

##### Android Setup

No additional setup is required for Android.

##### IOS Setup

Add the following entry to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

```plist
<key>NSCameraUsageDescription</key>
<string>Can I use the camera please?</string>
<key>NSMicrophoneUsageDescription</key>
<string>Can I use the microphone please?</string>
```


#### Example

```dart
import 'package:flutter/material.dart';
import 'package:stream_rtmp/stream_rtmp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isStreaming = false;

  void _startStream() {
    StreamRtmpPlugin.startStream("rtmp://example.com/stream");
    setState(() {
      _isStreaming = true;
    });
  }

  void _stopStream() {
    StreamRtmpPlugin.stopStream();
    setState(() {
      _isStreaming = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isStreaming
            ? FloatingActionButton(
                onPressed: _stopStream,
                child: const Text("Stop Stream"),
              )
            : FloatingActionButton(
                onPressed: _startStream,
                child: const Text("Start Stream"),
              ),
      ),
    );
  }
}
```
#### License

This plugin is available under the MIT License.

