import 'package:url_launcher/url_launcher.dart';

Future<bool> openExternalLink(String url) async {
  final uri = Uri.parse(url);
  if (!await canLaunchUrl(uri)) {
    return false;
  }
  return launchUrl(uri, webOnlyWindowName: '_blank');
}
