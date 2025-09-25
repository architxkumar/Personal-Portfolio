import 'package:flutter/material.dart';
import 'package:personal_portfolio/const/strings.dart';
import 'package:personal_portfolio/const/widget.dart';
import 'package:personal_portfolio/model/work.dart';
import 'package:personal_portfolio/service.dart';

import 'model/review.dart';

class DesktopLandingPage extends StatelessWidget {
  const DesktopLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: appBarIcon,
        actions: appBarActions,
      ),
      body: ListView(
        children: [
          DesktopHeroSection(),
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: DesktopProjectBlock(),
                  ),
                  VerticalDivider(
                    color: borderColor,
                  ),
                  Expanded(
                    flex: 1,
                    child: DesktopWorkExperienceBlock(),
                  ),
                  VerticalDivider(
                    color: borderColor,
                  ),
                  Expanded(
                    flex: 1,
                    child: QualificationBlock(),
                  ),
                ],
              ),
            ),
          ),
          ReviewBlock(),
          CopyrightBlock()
        ],
      ),
    );
  }
}

class DesktopHeroSection extends StatelessWidget {
  const DesktopHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 250),
      child: Center(
        child: Text(
          heroTitle,
          style: TextTheme.of(context).displayMedium,
        ),
      ),
    );
  }
}

class DesktopProjectBlock extends StatelessWidget {
  const DesktopProjectBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DesktopProjectItem> projectsList = projectTitles
        .map((e) => DesktopProjectItem(e))
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
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

class DesktopProjectItem extends StatelessWidget {
  final String text;

  const DesktopProjectItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final borderColor = getBorderColor(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: Text(
        text,
        style: TextTheme.of(context).titleMedium,
      ),
    );
  }
}

class DesktopWorkExperienceBlock extends StatelessWidget {
  const DesktopWorkExperienceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final workExperienceWidgetList = workExperienceList
        .map(
          (e) => WorkExperienceItem(workEntry: e),
        )
        .toList();
    final borderColor = getBorderColor(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            workExperienceBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        for (int i = 0; i < workExperienceWidgetList.length; i++) ...[
          if (i != 0)
            Divider(
              color: borderColor,
            ),
          workExperienceWidgetList[i],
        ],
      ],
    );
  }
}

class WorkExperienceItem extends StatelessWidget {
  final WorkModel workEntry;

  const WorkExperienceItem({super.key, required this.workEntry});

  @override
  Widget build(BuildContext context) {
    final profileButtonLabelColor = getProfileButtonLabelColor(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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

class QualificationBlock extends StatelessWidget {
  const QualificationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = courseITookList.map((e) => _bulletPoint(e)).toList();
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Text(
            qualificationBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
          Text(qualificationDetail),
          Text(coursesITookLabel),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 4.0,
              children: courses,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class DesktopReviewCard extends StatelessWidget {
  final Review review;

  const DesktopReviewCard(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                review.reviewText,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '${review.reviewerName}\n${review.reviewerDesignation}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final reviewCardWidgetList = reviewList
        .map(
          (e) => Expanded(child: DesktopReviewCard(e)),
        )
        .toList();
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        spacing: 16.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            reviewBlockTitle,
            style: TextTheme.of(context).titleLarge,
          ),
          IntrinsicHeight(
            child: Row(
              spacing: 16,
              children: reviewCardWidgetList,
            ),
          ),
        ],
      ),
    );
  }
}

