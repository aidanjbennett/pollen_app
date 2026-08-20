import 'package:flutter/material.dart';

class PollenTypeWidget extends StatelessWidget {
  const PollenTypeWidget({
    super.key,
    required this.label,
    required this.value,
    required this.level,
    required this.color,
    required this.backgroundColor,
  });

  final String label;
  final int value;
  final String level;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final circleSize = constraints.maxWidth.clamp(56.0, 80.0);
        final progress = (value / 100).clamp(0.0, 1.0);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: circleSize,
              height: circleSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: circleSize,
                    height: circleSize,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: circleSize * 0.12,
                      strokeCap: StrokeCap.round,
                      color: color,
                      backgroundColor: backgroundColor,
                    ),
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(
                      fontSize: circleSize * 0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                level,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
