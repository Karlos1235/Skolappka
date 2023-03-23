import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../core/view_models/home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Domácí obrazovka'),
          ),
          body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.ice_skating)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarms_sharp)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_tree_sharp)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_chart_sharp)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.adb)),
            ],
          ),
        ));
  }
}