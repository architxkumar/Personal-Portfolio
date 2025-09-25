import 'package:flutter/material.dart';
import 'package:personal_portfolio/landing_desktop.dart';
import 'package:personal_portfolio/landing_mobile.dart';

void main() => runApp(PersonalPortfolioApp());

class PersonalPortfolioApp extends StatelessWidget {
  const PersonalPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      title: 'Personal Portfolio',
      home: LayoutBuilder(
        builder: (context, constraints) => (constraints.maxWidth < 700)
            ? MobileLandingPage()
            : DesktopLandingPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
