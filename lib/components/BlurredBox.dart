import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredBox extends StatelessWidget {
  final String text;

  const BlurredBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // <-- IMPORTANT
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(20), // <-- same radius
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
