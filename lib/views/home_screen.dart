import 'package:flutter/material.dart';

import 'package:pollen_app/widgets/app_navigation_bar.dart';
import 'package:pollen_app/widgets/home/analysis_card_widget.dart';
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
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
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

            const SizedBox(height: 24),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
              child: Row(
                children: [
                  AnalysisCardWidget(
                    title: 'Pollen Analysis',
                    icon: Icons.analytics_outlined,
                  ),
                  const SizedBox(width: 12),
                  AnalysisCardWidget(
                    title: 'Pollen Forecast',
                    icon: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(width: 12),
                  AnalysisCardWidget(
                    title: 'Weather',
                    icon: Icons.cloud_outlined,
                  ),
                  const SizedBox(width: 12),
                  AnalysisCardWidget(
                    title: 'Allergy Log',
                    icon: Icons.edit_note_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigationBar(selectedIndex: 0),
    );
  }
}
