import 'package:flutter/material.dart';

class FarmPlanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onClosePressed; // Callback for button

  const FarmPlanAppBar({super.key, this.onClosePressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "FarmPlan",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.green,
      actions: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: onClosePressed, // Trigger callback
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
