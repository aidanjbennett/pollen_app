import 'package:flutter/material.dart';

class PollenTypeWidget extends StatelessWidget {
  final String label;
  final int value;
  final String level;
  final Color color;
  final Color backgroundColor;

  const PollenTypeWidget({
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
