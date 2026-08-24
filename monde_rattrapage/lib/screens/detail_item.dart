import 'package:flutter/material.dart';
import 'package:monde_rattrapage/models/rss_item.dart';

class DetailItem extends StatelessWidget {
  final RSSItem item;
  const DetailItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(254, 47, 18, 235),
        foregroundColor: const Color.fromARGB(255, 254, 255, 255),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.enclosure.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  item.enclosure,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 220,
                    child: ColoredBox(
                      color: Color(0xFFE8EAF0),
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (item.enclosure.isNotEmpty) const SizedBox(height: 16),

            const SizedBox(height: 8),
            Text(
              'Published on: ${item.pubDate.toLocal()}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(item.description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
