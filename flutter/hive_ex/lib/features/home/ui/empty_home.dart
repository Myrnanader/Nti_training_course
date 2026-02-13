import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/color_manager.dart';
import '../../../core/theme/text_styles.dart';

class EmptyHome extends StatelessWidget {
  const EmptyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes", style: TextStyles.heading),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.emptyHomeImage,
              height: 280.h,
            ),
            SizedBox(height: 16.h),
            Text(
              AppStrings.emptyHomeMessage,
              style: TextStyles.body.copyWith(fontSize: 18.sp),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primary,
        onPressed: () => context.go(Routes.newNote),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
