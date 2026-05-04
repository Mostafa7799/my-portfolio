import 'dart:convert';

import 'package:http/http.dart' as http;

/// Extracts the numeric App Store ID from an App Store URL.
/// e.g. "https://apps.apple.com/us/app/nextapp-ecs/id6449401732" → "6449401732"
String? extractAppStoreId(String url) {
  final match = RegExp(r'/id(\d+)').firstMatch(url);
  return match?.group(1);
}

/// Fetches the artwork URL (512×512) from the iTunes Lookup API.
/// Returns null on any error.
Future<String?> fetchItunesArtwork(String appStoreUrl) async {
  final id = extractAppStoreId(appStoreUrl);
  if (id == null) return null;
  try {
    final uri = Uri.parse('https://itunes.apple.com/lookup?id=$id');
    final response = await http.get(uri).timeout(const Duration(seconds: 8));
    if (response.statusCode != 200) return null;
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final results = json['results'] as List<dynamic>?;
    if (results == null || results.isEmpty) return null;
    return results.first['artworkUrl512'] as String?;
  } catch (_) {
    return null;
  }
}
