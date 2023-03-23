import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/debug_screen.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DebugScreenViewModel>.reactive(
        viewModelBuilder: () => DebugScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Lepší Quiz'),
          ),
          body: Container(),
        )
    );
  }
}