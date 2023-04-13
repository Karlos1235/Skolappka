import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class AktualityScreen extends StatefulWidget {
  @override
  _AktualityScreenState createState() => _AktualityScreenState();
}

class _AktualityScreenState extends State<AktualityScreen> {
  bool _isLoading = true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aktuality'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.spssecb.cz/aktuality',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              _controller.complete(controller);
            },
            onPageFinished: (String url) async {
              // Odebrání horní navigační lišty pomocí JavaScriptu
              await (await _controller.future).evaluateJavascript('''
                var header = document.querySelector('header');
                if (header != null) {
                  header.parentNode.removeChild(header);
                }
              ''');
              setState(() {
                _isLoading = false;
              });
            },
            navigationDelegate: (NavigationRequest request) {
              // Omezení navigace na původní doménu
              if (!request.url.startsWith('https://www.spssecb.cz/aktuality')) {
                return NavigationDecision.prevent;
              }
              return NavigationDecision.navigate;
            },
          ),
        ],
      ),
    );
  }
}