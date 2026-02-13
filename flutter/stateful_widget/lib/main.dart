import 'package:flutter/material.dart';
import 'package:stateful_widget/trafic_light_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traffic Light',
      home: const TrafficLightWidget(),
    );
  }
}