import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewExample extends StatelessWidget {
  const WebviewExample({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.youtube.com/'));
      // ..loadRequest(Uri.parse('https://flutter.dev'));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Webview Example'
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
