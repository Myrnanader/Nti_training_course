import 'package:flutter/material.dart';
import 'package:news_app/fearures/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: OnBoardingBody()));
  }
}
