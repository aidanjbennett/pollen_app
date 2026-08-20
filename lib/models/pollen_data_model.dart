import 'package:flutter/material.dart';

class PollenData {
  const PollenData({
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
}
