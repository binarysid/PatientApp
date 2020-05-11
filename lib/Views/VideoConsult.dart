import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class VideoConsult extends StatefulWidget {
  @override
  _VideoConsultState createState() => _VideoConsultState();
}

class _VideoConsultState extends State<VideoConsult> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wikipedia Explorer'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
        initialUrl: 'http://10.0.2.2:5000/video_feed',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),

    );
  }
}
