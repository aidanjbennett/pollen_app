import 'package:flutter/material.dart';
import 'package:pollen_app/models/pollen_item_model.dart';
import 'package:pollen_app/widgets/ads/banner_ad_widget.dart';
import 'package:pollen_app/widgets/pollen_analytics/pollen_section_widget.dart';

class PollenAnalysisScreen extends StatelessWidget {
  const PollenAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pollen Analysis')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            const Text(
              'AB1 2CD',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 24),

            PollenSectionWidget(
              title: 'Tree Analytics',
              icon: Icons.park_outlined,
              items: const [
                PollenItem(
                  name: 'Birch',
                  value: 12,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
                PollenItem(
                  name: 'Oak',
                  value: 5,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
                PollenItem(
                  name: 'Alder',
                  value: 25,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                ),
                PollenItem(
                  name: 'Hazel',
                  value: 8,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
              ],
            ),

            const SizedBox(height: 20),

            PollenSectionWidget(
              title: 'Weed Analytics',
              icon: Icons.grass_outlined,
              items: const [
                PollenItem(
                  name: 'Ragweed',
                  value: 50,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                ),
                PollenItem(
                  name: 'Nettle',
                  value: 32,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                ),
                PollenItem(
                  name: 'Plantain',
                  value: 10,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
              ],
            ),

            const SizedBox(height: 20),

            PollenSectionWidget(
              title: 'Grass Analytics',
              icon: Icons.eco_outlined,
              items: const [
                PollenItem(
                  name: 'Timothy Grass',
                  value: 15,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
                PollenItem(
                  name: 'Ryegrass',
                  value: 35,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                ),
                PollenItem(
                  name: 'Meadow Grass',
                  value: 8,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const BannerAdWidget(),
          ],
        ),
      ),
    );
  }
}
