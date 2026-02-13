import 'package:bmi_calculator/core/theming/color_manager.dart';
import 'package:bmi_calculator/core/theming/text_styles.dart';
import 'package:flutter/material.dart';


class HeightSlider extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightSlider({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.grey3Color,
        borderRadius: BorderRadius.circular(48),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HEIGHT", style: TextStyles.label),
          const SizedBox(height: 10),
          Text("$height cm", style: TextStyles.number),
          Slider(
            value: height.toDouble(),
            min: 100,
            max: 220,
            activeColor: ColorManager.redColor,
            inactiveColor: ColorManager.grey1Color,
            onChanged: (val) => onChanged(val.round()),
          ),
        ],
      ),
    );
  }
}