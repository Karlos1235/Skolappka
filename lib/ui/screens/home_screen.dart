import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            initialUrl: 'https://www.spssecb.cz',
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
              if (!request.url.startsWith('https://www.spssecb.cz')) {
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