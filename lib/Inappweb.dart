import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebPage extends StatefulWidget {
  const InAppWebPage({Key? key}) : super(key: key);

  @override
  State<InAppWebPage> createState() => _InAppWebPageState();
}

class _InAppWebPageState extends State<InAppWebPage> {
  late InAppWebViewController webView;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("In-App WebView"),
      // ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri.uri(Uri.parse("https://erishikesh.com")),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStart: (InAppWebViewController controller, Uri? url) {
              // print("Page started loading: $url");
            },
            onLoadStop: (InAppWebViewController controller, Uri? url) {
              // print("Page finished loading: $url");
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          if (_progress < 1.0)
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.orange.withOpacity(0.2),
              ),
            ),
        ],
      ),
    );
  }
}
