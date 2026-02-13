import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/bmi_cubit.dart';
import 'logic/cubit/bmi_state.dart';
import 'widgets/gender_card.dart';
import 'widgets/height_slider.dart';
import 'widgets/value_picker.dart';
import '../../core/helper/helper_function.dart';
import '../bmi_results/bmi_result_screen.dart';
import '../../core/theming/color_manager.dart';
import '../../core/theming/text_styles.dart';

class BmiDataScreen extends StatelessWidget {
  const BmiDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('BMI CALCULATOR')),
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GenderCard(
                          gender: GenderType.male,
                          selectedGender: state.gender,
                          onTap: () {
                            context.read<BmiCubit>().selectGender(GenderType.male);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: GenderCard(
                          gender: GenderType.female,
                          selectedGender: state.gender,
                          onTap: () {
                            context.read<BmiCubit>().selectGender(GenderType.female);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: HeightSlider(
                    height: state.height,
                    onChanged: (val) {
                      context.read<BmiCubit>().changeHeight(val);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ValuePicker(
                          label: "Weight",
                          value: state.weight,
                          onIncrement: () {
                            context.read<BmiCubit>().incrementWeight();
                          },
                          onDecrement: () {
                            context.read<BmiCubit>().decrementWeight();
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ValuePicker(
                          label: "Age",
                          value: state.age,
                          onIncrement: () {
                            context.read<BmiCubit>().incrementAge();
                          },
                          onDecrement: () {
                            context.read<BmiCubit>().decrementAge();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    final bmi = calculateBmi(
                      state.weight,
                      state.height.toDouble(),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BmiResultScreen(
                          bmi: bmi,
                          age: state.age,
                          gender: state.gender ?? GenderType.male,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.redColor,
                      borderRadius: BorderRadius.circular(48),
                    ),
                    child: Center(
                      child: Text("CALCULATE", style: TextStyles.button),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
