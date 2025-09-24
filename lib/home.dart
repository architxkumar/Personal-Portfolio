import 'package:flutter/material.dart';
import 'package:personal_portfolio/const.dart';

class DesktopLandingPage extends StatelessWidget {
  const DesktopLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archit Kumar'),
        leading: appBarIcon,
        actions: appBarActions,
      ),
    );
  }
}

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 8.0,
              children: [
                appBarIcon,
                Text(
                  appBarTitle,
                  style: TextTheme.of(context).headlineSmall,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: appBarActions,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
