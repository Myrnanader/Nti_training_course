import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theming/color_manager.dart';
import 'core/theming/text_styles.dart';
import 'features/bmi_data/bmi_data_screen.dart';
import 'features/bmi_data/logic/cubit/bmi_cubit.dart';

class BmiCalcApp extends StatelessWidget {
  const BmiCalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorManager.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorManager.backgroundColor,
          titleTextStyle: TextStyles.title,
          elevation: 0,
        ),
      ),
      home: BlocProvider(
        create: (_) => BmiCubit(),
        child: const BmiDataScreen(),
      ),
    );
  }
}
