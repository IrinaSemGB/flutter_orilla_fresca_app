import 'package:flutter/material.dart';
import '../helpers/constants.dart';

class TabBarIconButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  TabBarIconButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: IconButton(
          icon: Icon(icon, color: AppColors.GREEN),
          onPressed: onPressed,
        ),
      ),
    );
  }
}