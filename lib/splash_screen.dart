import 'package:disco/dashboard.dart';
import 'package:disco/app_details.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String route = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for (int x = 0; x <= showText.length; x++) {
        int animWaitMillis = x == showText.length ? 1500 : 500; //final loop for extra wait
        await Future.delayed(Duration(milliseconds: animWaitMillis));
        if (!context.mounted) return;
        if (x != showText.length) {
          setState(() {
            showText[x] = true;
          });
        }
      }

      if (mounted) {
        Navigator.pushReplacementNamed(context, Dashboard.route);
      }
    });
  }

  List<String> appTitleList = AppDetails.appTitle.split(" ");
  List<bool> showText = List.filled(AppDetails.appTitle.split(" ").length, false, growable: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [for (int x = 0; x < showText.length; x++) _flyInTitle(appTitleList[x], showText[x])],
        ),
      ),
    );
  }

  Widget _flyInTitle(String title, bool show) {
    return AnimatedAlign(
      alignment: show ? Alignment.centerLeft : Alignment.centerRight,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
      child: Text.rich(TextSpan(text: show ? title : " ", style: Theme.of(context).textTheme.displayLarge)),
    );
  }
}
