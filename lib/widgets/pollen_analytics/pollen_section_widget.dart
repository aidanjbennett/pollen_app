import 'package:flutter/material.dart';
import 'package:pollen_app/models/pollen_item_model.dart';
import 'package:pollen_app/widgets/pollen_analytics/pollen_analytics_row_widget.dart';

class PollenSectionWidget extends StatelessWidget {
  const PollenSectionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<PollenItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PollenAnalyticsRowWidget(item: item),
            ),
          ),
        ],
      ),
    );
  }
}
