import 'package:bmi_calculator/core/theming/color_manager.dart';
import 'package:bmi_calculator/core/theming/text_styles.dart';
import 'package:bmi_calculator/features/bmi_data/widgets/gender_card.dart';
import 'package:flutter/material.dart';

import 'widgets/bmi_result_bar.dart';
import 'widgets/bmi_result_info.dart';

class BmiResultScreen extends StatelessWidget {
  final double bmi;
  final int age;
  final GenderType gender;

  const BmiResultScreen({
    super.key,
    required this.bmi,
    required this.age,
    required this.gender,
  });

  String get genderLabel => gender == GenderType.male ? 'Male' : 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ColorManager.redColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Result', style: TextStyles.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BmiResultInfo(
              gender: genderLabel,
              bmi: bmi.toStringAsFixed(1),
              age: age.toString(),
            ),
            const SizedBox(height: 104),
            BmiResultBar(bmi: bmi),
          ],
        ),
      ),
    );
  }
}
