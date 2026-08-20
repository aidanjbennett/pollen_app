import 'package:flutter/material.dart';
import 'package:pollen_app/widgets/app_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pollen App")),
      body: SafeArea(
        child: Column(children: [Center(child: Text("Settings"))]),
      ),
      bottomNavigationBar: AppNavigationBar(selectedIndex: 1),
    );
  }
}
