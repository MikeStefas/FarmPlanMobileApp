import 'package:flutter/material.dart';

class HomepageButton extends StatelessWidget {
  const HomepageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/inputpage');
      },
      child: const Text("Start"),
    );
  }
}
