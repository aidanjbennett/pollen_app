import 'package:flutter/material.dart';
import 'package:pollen_app/services/consent_service.dart';
import 'package:pollen_app/widgets/app_navigation_bar.dart';

class SettingsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pollen App")),
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Text("Settings")),
            ListTile(
              leading: const Icon(Icons.privacy_tip_outlined),
              title: const Text('Privacy settings'),
              subtitle: const Text(
                'Manage advertising and privacy preferences',
              ),
              onTap: () async {
                await ConsentService.instance.showPrivacyOptions();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppNavigationBar(selectedIndex: 1),
    );
  }
}
