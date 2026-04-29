import 'package:color_scheme_display/color_scheme_display.widget.dart';
import 'package:disco/app_details.dart';
import 'package:disco/widgets/die.dart';
import 'package:disco/widgets/rerollable_die.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const String route = "/dash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppDetails.appTitle), centerTitle: true, automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("\"Would you like to play a game?\"", textAlign: .end),
                const Text("- WOPR ", textAlign: .end),
                const SizedBox(height: 20),
                RerollableDie(die: Die.coin()),
                RerollableDie(die: Die.d6(), buttonAxis: Axis.horizontal),
                RerollableDie(die: Die.d20()),
              ],
            ),
            SizedBox(height: 30.0),
            _buttonForThemeColors(context, brightness: Brightness.dark),
          ],
        ),
      ),
    );
  }

  Widget _buttonForThemeColors(BuildContext context, {Brightness? brightness}) {
    final String themeColorTitle = "Material Theme Colors";

    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text(themeColorTitle)),
              body: ColorSchemeDisplay(),
            ),
          ),
        );
      },
      child: Text(themeColorTitle),
    );
  }
}
