import 'package:flutter/material.dart';
import 'package:monde_rattrapage/models/rss_item.dart';
import 'package:monde_rattrapage/screens/get_item_rss.dart';
import 'package:monde_rattrapage/services/fetch_rss_item.dart';

class HomeMonde extends StatefulWidget {
  const HomeMonde({super.key});

  @override
  State<HomeMonde> createState() => _HomeMondeState();
}

class _HomeMondeState extends State<HomeMonde> {
  late Future<List<RSSItem>> _futureItems;

  @override
  void initState() {
    super.initState();
    _futureItems = fetchRSSItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Le journal LeMonde'), backgroundColor: const Color.fromARGB(146, 235, 72, 197)),
      body: FutureBuilder<List<RSSItem>>(
        future: _futureItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }
          final items = snapshot.data ?? [];
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.title),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GetItemRss(item: item)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
