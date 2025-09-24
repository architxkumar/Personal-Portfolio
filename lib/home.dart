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
                  style: TextTheme.of(context).titleLarge,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: appBarActions,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Flutter Developer',
              style: TextTheme.of(context).headlineSmall,
            ),
          ),
          ProjectBlock(),
        ],
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String projectTitle;

  const ProjectItem(this.projectTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: BorderDirectional(bottom: BorderSide(color: Colors.black)),
      ),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        projectTitle,
      ),
    );
  }
}

class ProjectBlock extends StatelessWidget {
  final List<ProjectItem> projectsList = const [
    ProjectItem('HTML Only Portfolio'),
    ProjectItem('Basic Webapp in Flutter'),
    ProjectItem('Personal Portfolio in Flutter'),
    ProjectItem('E-commerce App UI in Flutter'),
    ProjectItem('Chat App UI in Flutter'),
  ];
  const ProjectBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            'Projects',
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        ...projectsList,
      ],
    );
  }
}
