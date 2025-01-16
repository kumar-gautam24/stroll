import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;

  const ActionButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF7B78B3).withAlpha(51),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
