import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView'),
        actions: [
          IconButton(
            onPressed: () {
              _controller?.reload();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              _controller?.clearCache();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          key: UniqueKey(),
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          debuggingEnabled: true,
          initialUrl: 'http://45.88.223.165:8069/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
