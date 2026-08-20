import 'package:flutter/material.dart';

class PollenItem {
  const PollenItem({
    required this.name,
    required this.value,
    required this.level,
    required this.color,
  });

  final String name;
  final int value;
  final String level;
  final Color color;
}
