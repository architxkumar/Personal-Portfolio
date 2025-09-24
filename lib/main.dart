import 'package:flutter/material.dart';
import 'package:personal_portfolio/home.dart';

void main() => runApp(PersonalPortfolioApp());

class PersonalPortfolioApp extends StatelessWidget {
  const PersonalPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Portfolio',
      home: LayoutBuilder(
        builder: (context, constraints) => (constraints.maxWidth < 800)
            ? MobileLandingPage()
            : DesktopLandingPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
