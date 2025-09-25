import 'package:flutter/material.dart';
import 'package:personal_portfolio/const/widget.dart';
import 'package:personal_portfolio/model/work.dart';
import 'package:personal_portfolio/service.dart';

import 'const/strings.dart';

class MobileLandingPage extends StatelessWidget {
  const MobileLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MobileLandingAppBar(),
          MobileHeroSection(),
          MobileProjectBlock(),
          MobileWorkExperienceBlock(),
          MobileQualificationBlock(),
          MobileReviewBlock(),
          CopyrightBlock()
        ],
      ),
    );
  }
}

class MobileLandingAppBar extends StatelessWidget {
  const MobileLandingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class MobileHeroSection extends StatelessWidget {
  const MobileHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      alignment: Alignment.center,
      child: Text(
        heroTitle,
        style: TextTheme.of(context).headlineSmall,
      ),
    );
  }
}

class MobileProjectItem extends StatelessWidget {
  final String projectTitle;

  const MobileProjectItem(this.projectTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: borderColor,
          ),
        ),
      ),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        projectTitle,
      ),
    );
  }
}

class MobileProjectBlock extends StatelessWidget {
  const MobileProjectBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MobileProjectItem> projectsList = projectTitles
        .map((e) => MobileProjectItem(e))
        .toList();
    final borderColor = getBorderColor(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: borderColor)),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            projectBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        ...projectsList,
      ],
    );
  }
}

class MobileWorkExperienceBlock extends StatelessWidget {
  const MobileWorkExperienceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor(context);
    final workExperienceWidgetList = workExperienceList
        .map((e) => MobileWorkExperienceBlockItem(workEntry: e))
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: borderColor)),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            workExperienceBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        ...workExperienceWidgetList,
      ],
    );
  }
}

class MobileWorkExperienceBlockItem extends StatelessWidget {
  final WorkModel workEntry;

  const MobileWorkExperienceBlockItem({
    super.key,
    required this.workEntry,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor(context);
    final profileButtonLabelColor = getProfileButtonLabelColor(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(bottom: BorderSide(color: borderColor)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        children: [
          Text(
            workEntry.companyName,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            workEntry.role,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final result = await urlLauncher(workEntry.profileLink);
                if (result.isError()) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(snackBarErrorMessage)),
                    );
                  }
                }
              },
              child: Text(
                profileButtonLabel,
                style: TextStyle(color: profileButtonLabelColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileQualificationBlock extends StatelessWidget {
  const MobileQualificationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> courseListWidget = courseITookList
        .map(
          (e) => BulletPoint(e),
        )
        .toList();
    final borderColor = getBorderColor(context);
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(bottom: BorderSide(color: borderColor)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              qualificationBlockTitle,
              style: TextTheme.of(context).titleLarge,
            ),
          ),
          Text(qualificationDetail),
          Text(coursesITookLabel),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 4.0,
              children: courseListWidget,
            ),
          ),
        ],
      ),
    );
  }
}

class MobileReviewBlock extends StatelessWidget {
  const MobileReviewBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewWidgetList = reviewList
        .map((e) => MobileReviewCard(e))
        .toList();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        spacing: 16.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reviewBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
          ...reviewWidgetList,
        ],
      ),
    );
  }
}
