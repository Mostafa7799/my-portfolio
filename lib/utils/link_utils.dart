import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalLink(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, webOnlyWindowName: '_blank');
}
