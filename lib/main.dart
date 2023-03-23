import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:skolappka/ui/screens/debug_screen.dart';
import 'package:skolappka/ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/localization',
      supportedLocales: const [Locale('cs')],
      fallbackLocale: const Locale('cs'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Školappka',
      initialRoute: '/',
      routes: {
        '/debug': (context) => const DebugScreen(),
        '/home': (context) => const HomeScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DebugScreen(),
    );
  }
}