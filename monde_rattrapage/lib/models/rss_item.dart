class RSSItem {
  final String title;
  final String description;
  final DateTime pubDate;
  final String enclosure;

  RSSItem({
    required this.title,
    required this.enclosure,
    required this.description,
    required this.pubDate,
  });
  factory RSSItem.fromJson(Map<String, dynamic> json) {
    final enclosure = json['enclosure'] as Map<String, dynamic>?;
    final link = enclosure?['link'] as String?;

    return RSSItem(
      title: json['title'] ?? '',
      enclosure: link ?? '',
      description: json['description'] ?? '',
      pubDate: DateTime.parse(
        json['pubDate'] ?? DateTime.now().toIso8601String(),
      ),
    );

  }
}
