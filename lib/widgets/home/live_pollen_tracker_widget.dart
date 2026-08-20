import 'package:flutter/material.dart';
import 'package:pollen_app/widgets/home/pollen_type_widget.dart';

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
                child: PollenTypeWidget(
                  label: 'Tree',
                  value: 0,
                  level: 'Low',
                  color: Color(0xFF16A34A),
                  backgroundColor: Color(0xFFDDF3E5),
                ),
              ),
              Expanded(
                child: PollenTypeWidget(
                  label: 'Weed',
                  value: 50,
                  level: 'Medium',
                  color: Color(0xFFFF9500),
                  backgroundColor: Color(0xFFFFE2B3),
                ),
              ),
              Expanded(
                child: PollenTypeWidget(
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
