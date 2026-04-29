import 'package:disco/screens/dashboard.dart';
import 'package:disco/screens/splash_screen.dart';
import 'package:disco/app_details.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppDetails.appName,
      theme: AppDetails.buildTheme(Brightness.light),
      initialRoute: SplashScreen.route,
      routes: {
        SplashScreen.route: (BuildContext context) => const SplashScreen(),
        Dashboard.route: (BuildContext context) => const Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
