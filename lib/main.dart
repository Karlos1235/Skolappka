import 'package:flutter/material.dart';
import 'package:skolappka/ui/screens/debug_screen.dart';

void main() {
  runApp(const MyApp());
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
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DebugScreen(),
    );
  }
}