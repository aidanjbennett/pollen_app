import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pollen_app/viewmodels/home_view_model.dart';
import 'package:pollen_app/widgets/app_navigation_bar.dart';
import 'package:pollen_app/widgets/home/analysis_card_widget.dart';
import 'package:pollen_app/widgets/home/live_pollen_tracker_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  bool _hasValue(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();
    final hasPostCode = _hasValue(homeViewModel.postCode);
    final hasTemperature = _hasValue(homeViewModel.currentTemperature);

    return Scaffold(
      appBar: AppBar(title: const Text('Pollen App')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasPostCode || hasTemperature)
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasPostCode)
                      Text(
                        homeViewModel.postCode!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),

                    if (hasTemperature)
                      Text(
                        homeViewModel.currentTemperature!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),

            if (hasPostCode || hasTemperature) const SizedBox(height: 16),

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
                    onTap: () {
                      if (kDebugMode) {
                        print('Pollen Analysis clicked');
                      }
                    },
                  ),

                  const SizedBox(width: 12),

                  AnalysisCardWidget(
                    title: 'Pollen Forecast',
                    icon: Icons.calendar_today_outlined,
                    onTap: () {
                      if (kDebugMode) {
                        print('Pollen Forecast clicked');
                      }
                    },
                  ),

                  const SizedBox(width: 12),

                  AnalysisCardWidget(
                    title: 'Allergy Log',
                    icon: Icons.edit_note_outlined,
                    onTap: () {
                      if (kDebugMode) {
                        print('Allergy Log clicked');
                      }
                    },
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
