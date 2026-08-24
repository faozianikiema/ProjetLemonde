import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:monde_rattrapage/screens/get_item_rss.dart';
import 'package:monde_rattrapage/provider/rss_provider.dart';

class HomeMonde extends StatefulWidget {
  const HomeMonde({super.key});

  @override
  State<HomeMonde> createState() => _HomeMondeState();
}

class _HomeMondeState extends State<HomeMonde> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RssProvider>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le journal LeMonde'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            tooltip: 'Trier par date',
            onPressed: () {
              Provider.of<RssProvider>(
                context,
                listen: false,
              ).changerTri(ContrainteTri.date);
            },
          ),
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            tooltip: 'Trier par titre',
            onPressed: () {
              Provider.of<RssProvider>(
                context,
                listen: false,
              ).changerTri(ContrainteTri.titre);
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(254, 47, 18, 235),
        foregroundColor: const Color.fromARGB(255, 254, 255, 255),
      ),
      body: Consumer<RssProvider>(
        builder: (context, rssProvider, child) {
          if (rssProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (rssProvider.erreur != null) {
            return Center(child: Text('Erreur : ${rssProvider.erreur}'));
          }

          final items = rssProvider.items;
          if (items.isEmpty) {
            return const Center(child: Text('Aucun article disponible.'));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GetItemRss(item: item);
            },
          );
        },
      ),
    );
  }
}
