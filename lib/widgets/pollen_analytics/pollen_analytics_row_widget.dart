import 'package:flutter/material.dart';
import 'package:pollen_app/models/pollen_item_model.dart';

class PollenAnalyticsRowWidget extends StatelessWidget {
  const PollenAnalyticsRowWidget({super.key, required this.item});

  final PollenItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),

          Text(
            item.value.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: item.color,
            ),
          ),

          const SizedBox(width: 12),

          Container(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: item.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              item.level,
              style: TextStyle(fontWeight: FontWeight.w600, color: item.color),
            ),
          ),
        ],
      ),
    );
  }
}
