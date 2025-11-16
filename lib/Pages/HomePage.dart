import 'package:farm_plan_app/components/BlurredBox.dart';
import 'package:farm_plan_app/components/FarmPlanButton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/farmplanback.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Container(height: 100),
              const Text(
                'FarmPlan',
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(height: 20),
              BlurredBox(text: "Reduce water waste"),
              Container(height: 20),
              BlurredBox(text: "Get 7 day plan"),
              Container(height: 20),
              BlurredBox(text: "Powered by AI"),
              Container(height: 20),
              HomepageButton(),
            ],
          ),
        ),
      ),
    );
  }
}
