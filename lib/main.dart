import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skolappka/ui/screens/aktuality_screen.dart';
import 'package:skolappka/ui/screens/home_screen.dart';
import 'package:skolappka/ui/screens/rozvrh_screen.dart';


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
      home: RozvrhScreen(),
    );
  }
}