import 'package:flutter/material.dart';

class LivePollenTrackerWidget extends StatelessWidget {
  const LivePollenTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey, // Background colour
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Live Pollen Tracker',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black,
                child: Icon(Icons.info_outline, color: Colors.white, size: 20),
              ),
            ],
          ),

          const SizedBox(height: 32),

          const Row(
            children: [
              Expanded(
                child: PollenType(
                  label: 'Tree',
                  value: 0,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                  backgroundColor: Color(0xFFDDF3E5),
                ),
              ),
              Expanded(
                child: PollenType(
                  label: 'Weed',
                  value: 50,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                  backgroundColor: Color(0xFFFFE2B3),
                ),
              ),
              Expanded(
                child: PollenType(
                  label: 'Grass',
                  value: 15,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                  backgroundColor: Color(0xFFDDF3E5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PollenType extends StatelessWidget {
  final String label;
  final int value;
  final String level;
  final Color color;
  final Color backgroundColor;

  const PollenType({
    super.key,
    required this.label,
    required this.value,
    required this.level,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: value / 100,
                  strokeWidth: 10,
                  strokeCap: StrokeCap.round,
                  color: color,
                  backgroundColor: backgroundColor,
                ),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),

        const SizedBox(height: 12),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            level,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
