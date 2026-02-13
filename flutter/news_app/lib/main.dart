import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:device_preview/device_preview.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/fearures/home/data/local_data_source/news_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // Hive.registerAdapter(NewsHiveModelAdapter());

  await Hive.openBox<NewsHiveModel>('cachedNews');

  runApp(
    DevicePreview(
      enabled: true, // خليها false وقت ال production
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      routerConfig: AppRouter.routes,
      title: 'news app',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}