import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final String name;
  final Color nameColor;
  final Color backgroundColor;
  final BorderSide border;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? iconColor;

  LoginButton({
    required this.name,
    required this.nameColor,
    required this.backgroundColor,
    required this.border,
    required this.onPressed,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: border,
          backgroundColor: backgroundColor,
          padding: EdgeInsets.all(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            SizedBox(width: 10.0),
            Text(
              name,
              style: TextStyle(
                color: nameColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}