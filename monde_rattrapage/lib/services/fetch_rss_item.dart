import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:monde_rattrapage/models/rss_item.dart';

Future<List<RSSItem>> fetchRSSItem() async {
  final response = await http.get(
    Uri.parse(
      'https://api.rss2json.com/v1/api.json?rss_url=https%3A%2F%2Fwww.lemonde.fr%2Frss%2Fune.xml&api_key=1kizehvrf1denm5sku6hzcaxgxiga8d6tahdrzpz',
    ),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode != 200) {
    throw Exception('Erreur HTTP ${response.statusCode}');
  }

  final Map<String, dynamic> jsonMap = jsonDecode(response.body);
  final List<dynamic> items = jsonMap['items'] as List<dynamic>;
  return items
      .map((item) => RSSItem.fromJson(item as Map<String, dynamic>))
      .toList();
}
