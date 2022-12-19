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
