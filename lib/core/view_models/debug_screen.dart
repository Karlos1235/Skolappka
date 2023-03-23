import 'package:flutter/material.dart';

class DebugScreenViewModel extends ChangeNotifier {
  void init() {}
  void goToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
}