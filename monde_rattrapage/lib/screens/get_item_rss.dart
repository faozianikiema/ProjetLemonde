import 'package:flutter/material.dart';
import 'package:monde_rattrapage/models/rss_item.dart';

class GetItemRss extends StatelessWidget {
  final RSSItem item;
  const GetItemRss({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: const Color.fromARGB(146, 183, 51, 235),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Published on: ${item.pubDate.toLocal()}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              item.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
          
          ],
        ),
      ),
    );
  }
}