import 'package:flutter/material.dart';

import 'package:pollen_app/models/pollen_data_model.dart';
import 'package:pollen_app/widgets/home/pollen_type_widget.dart';

class LivePollenTrackerWidget extends StatelessWidget {
  const LivePollenTrackerWidget({super.key, this.onInfoTap});

  final VoidCallback? onInfoTap;

  @override
  Widget build(BuildContext context) {
    final pollenTypes = [
      const PollenData(
        label: 'Tree',
        value: 5,
        level: 'Low',
        color: Color(0xFF16A34A),
        backgroundColor: Color(0xFFDDF3E5),
      ),
      const PollenData(
        label: 'Weed',
        value: 50,
        level: 'Medium',
        color: Color(0xFFFF9500),
        backgroundColor: Color(0xFFFFE2B3),
      ),
      const PollenData(
        label: 'Grass',
        value: 15,
        level: 'Low',
        color: Color(0xFF16A34A),
        backgroundColor: Color(0xFFDDF3E5),
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsetsDirectional.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Live Pollen Tracker',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: onInfoTap,
                    icon: const Icon(Icons.info_outline),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    tooltip: 'Pollen information',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var index = 0; index < pollenTypes.length; index++) ...[
                    Expanded(
                      child: PollenTypeWidget(
                        label: pollenTypes[index].label,
                        value: pollenTypes[index].value,
                        level: pollenTypes[index].level,
                        color: pollenTypes[index].color,
                        backgroundColor: pollenTypes[index].backgroundColor,
                      ),
                    ),
                    if (index != pollenTypes.length - 1)
                      const SizedBox(width: 8),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
