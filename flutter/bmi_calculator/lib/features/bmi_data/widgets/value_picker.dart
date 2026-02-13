import 'package:bmi_calculator/core/theming/color_manager.dart';
import 'package:bmi_calculator/core/theming/text_styles.dart';
import 'package:flutter/material.dart';


class ValuePicker extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValuePicker({
    super.key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
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
          Text(label.toUpperCase(), style: TextStyles.label),
          const SizedBox(height: 10),
          Text("$value", style: TextStyles.number),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "$label-",
                mini: true,
                backgroundColor: ColorManager.grey3Color,
                onPressed: onDecrement,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                heroTag: "$label+",
                mini: true,
                backgroundColor: ColorManager.grey3Color,
                onPressed: onIncrement,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}