import 'package:bmi_calculator/core/theming/color_manager.dart';
import 'package:bmi_calculator/core/theming/text_styles.dart';
import 'package:flutter/material.dart';


enum GenderType { male, female }

class GenderCard extends StatelessWidget {
  final GenderType gender;
  final GenderType? selectedGender;
  final VoidCallback onTap;

  const GenderCard({
    super.key,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = gender == selectedGender;
    final icon = gender == GenderType.male ? Icons.male : Icons.female;
    final label = gender == GenderType.male ? 'MALE' : 'FEMALE';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.grey3Color,
          borderRadius: BorderRadius.circular(48),
          border: Border.all(
            color: isSelected ? ColorManager.redColor : Colors.transparent,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: isSelected ? ColorManager.redColor : ColorManager.whiteColor,
            ),
            const SizedBox(height: 10),
            Text(label, style: TextStyles.label),
          ],
        ),
      ),
    );
  }
}