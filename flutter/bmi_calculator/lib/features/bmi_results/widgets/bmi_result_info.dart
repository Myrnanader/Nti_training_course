import 'package:bmi_calculator/core/theming/text_styles.dart';
import 'package:flutter/material.dart';


class BmiResultInfo extends StatelessWidget {
  final String gender;
  final String bmi;
  final String age;

  const BmiResultInfo({
    super.key,
    required this.gender,
    required this.bmi,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 200,),
        Text("Gender: $gender", style: TextStyles.title.copyWith(fontSize: 32)),
        const SizedBox(height: 8),
        Text("BMI: $bmi", style:  TextStyles.title.copyWith(fontSize: 32)),
        const SizedBox(height: 8),
        Text("Age: $age", style:  TextStyles.title.copyWith(fontSize: 32)),
      ],
    );
  }
}