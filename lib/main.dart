import 'package:farm_plan_app/Pages/HomePage.dart';
import 'package:farm_plan_app/Pages/InputPage.dart';
import 'package:farm_plan_app/Pages/ResultPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FarmPlanApp());
}

class FarmPlanApp extends StatelessWidget {
  const FarmPlanApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmPlan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/inputpage': (context) => const InputPage(),
        '/resultpage': (context) => const ResultPage(),
      },
    );
  }
}
