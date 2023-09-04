import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tast_manager/ui/pages/splash/splash_view.dart';
import 'package:tast_manager/ui/shared/app_colors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kcAccentColor,
          primary: kcPrimaryColor,
        ),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
