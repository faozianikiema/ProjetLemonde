class RSSItem {
  final String title;
  final String link;
  final String description;
  final DateTime pubDate;

  RSSItem({
    required this.title,
    required this.link,
    required this.description,
    required this.pubDate,
  });

  factory RSSItem.fromJson(Map<String, dynamic> json) {
    return RSSItem(
      title: json['title'] ?? '',
      link: json['link'] ?? '',
      description: json['description'] ?? '',
      pubDate: DateTime.parse(json['pubDate'] ?? DateTime.now().toIso8601String()),
    );
  }
}