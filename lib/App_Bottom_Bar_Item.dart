import 'package:flutter/material.dart';

class AppBottomBarItem {
  final IconData icon;
  bool isSelected;
  final String label;

  AppBottomBarItem({
    required this.icon,
    this.label = '',
    this.isSelected = false,
  });
}