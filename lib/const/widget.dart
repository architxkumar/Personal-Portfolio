import 'package:flutter/material.dart';
import 'package:personal_portfolio/model/review.dart';

Color getBorderColor(BuildContext context) =>
    Theme.of(context).colorScheme.primaryContainer;

Color getProfileButtonLabelColor(BuildContext context) =>
    Theme.of(context).colorScheme.primary;

final List<Widget> appBarActions = [
  TextButton(
    onPressed: () {},
    child: Text('Home'),
  ),
  TextButton(
    onPressed: () {},
    child: Text('Projects'),
  ),
  TextButton(
    onPressed: () {},
    child: Text('Articles'),
  ),
  TextButton(
    onPressed: () {},
    child: Text('Contact'),
  ),
];

final Icon appBarIcon = Icon(Icons.account_circle_outlined);

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }
}

class MobileReviewCard extends StatelessWidget {
  final Review review;

  const MobileReviewCard(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8.0,
          children: [
            Text(
              review.reviewText,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${review.reviewerName}\n${review.reviewerDesignation}',
                style: TextTheme.of(context).labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CopyrightBlock extends StatelessWidget {
  const CopyrightBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text('© All rights reserved 2025'),
      ),
    );
  }
}
