import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/theme/text_styles.dart';
import '../logic/on_boarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.onboardingImage,
                height: 260.h,
              ),
              SizedBox(height: 50.h),

              Text(
                AppStrings.onboardingTitle,
                style: TextStyles.heading,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),

              Text(
                AppStrings.onboardingDesc,
                style: TextStyles.body,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),

              ElevatedButton(
                onPressed: () {
                  OnBoardingController.setOnBoarded();
                  context.go(Routes.home);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  fixedSize: Size(75.w, 75.h),
                  backgroundColor: ColorManager.primary,
                  elevation: 4,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
