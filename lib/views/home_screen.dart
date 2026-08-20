import 'package:flutter/material.dart';
import 'package:pollen_app/widgets/app_navigation_bar.dart';
import 'package:pollen_app/widgets/home/live_pollen_tracker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pollen App')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DE4 3GY',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Text(
                    '16°C',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const LivePollenTrackerWidget(),
            Row(
              children: [
                Text("Pollen Analysis"),
                Spacer(),
                Text("Pollen Forecast"),
                Spacer(),
                Text("Weather"),
                Spacer(),
                Text("Allegy Log"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(selectedIndex: 0),
    );
  }
}
