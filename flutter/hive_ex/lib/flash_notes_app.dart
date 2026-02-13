import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'core/theme/color_manager.dart';

class FlashNotesApp extends StatelessWidget {
  const FlashNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Flash Notes",
      theme: ThemeData(
        primaryColor: ColorManager.primary,
        scaffoldBackgroundColor: ColorManager.background,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}