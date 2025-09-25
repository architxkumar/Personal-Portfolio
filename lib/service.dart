import 'package:logger/logger.dart';
import 'package:result_dart/result_dart.dart';
import 'package:url_launcher/url_launcher.dart';

final logger = Logger();

Future<Result<bool>> urlLauncher(String url) async {
  final Uri uri = Uri.parse(url);
  try {
    await launchUrl(uri);
    logger.i('Launched URL: $url');
    return Success(true);
  } catch (e, s) {
    logger.e('Could not launch $url', error: e, stackTrace: s);
    return Failure(Exception('Could not launch $url'));
  }
}
