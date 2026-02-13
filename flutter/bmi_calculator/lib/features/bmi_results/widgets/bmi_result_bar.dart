import 'package:bmi_calculator/core/helper/helper_function.dart';
import 'package:flutter/material.dart';

class BmiResultBar extends StatelessWidget {
  final double bmi;

  const BmiResultBar({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 55 + (calcBmiIndex(bmi) * 40)),
          child: const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(height: 4),

        Row(
          children: [
            Expanded(
              child: Container(
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(child: Container(height: 16, color: Colors.lightGreen)),
            Expanded(child: Container(height: 16, color: Colors.orange)),
            Expanded(
              child: Container(
                height: 16,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        Row(
          children: const [
            Expanded(
              child: Text(
                "Underweight",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(
                "Normal",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(
                "Overweight",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(
                "Obesity",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
