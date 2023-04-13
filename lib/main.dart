import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/localization',
      supportedLocales: const [Locale('cs')],
      fallbackLocale: const Locale('cs'),
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPSSECB Aktuality',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dukla'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: WebView(
            initialUrl: 'https://www.spssecb.cz/aktuality',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}