import 'package:flutter/material.dart';
import 'package:monde_rattrapage/models/rss_item.dart';
import 'package:monde_rattrapage/services/fetch_rss_item.dart';

enum ContrainteTri { date, titre }

class RssProvider extends ChangeNotifier {
  List<RSSItem> _items = [];
  bool _isLoading = false;
  String? _erreur;

  ContrainteTri _contrainteTri = ContrainteTri.date;

  List<RSSItem> get items => _trieItems(_items);

  bool get isLoading => _isLoading;

  String? get erreur => _erreur;

  Future<void> loadItems() async {
    _isLoading = true;
    _erreur = null;
    notifyListeners();

    try {
      _items = await fetchRSSItem();
    } catch (e) {
      _erreur = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void changerTri(ContrainteTri nouveauTri) {
    _contrainteTri = nouveauTri;
    notifyListeners();
  }

  List<RSSItem> _trieItems(List<RSSItem> liste) {
    final copie = List<RSSItem>.from(liste);

    switch (_contrainteTri) {
      case ContrainteTri.date:
        copie.sort((a, b) => b.pubDate.compareTo(a.pubDate));
        break;

      case ContrainteTri.titre:
        copie.sort(
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        );
        break;
    }

    return copie;
  }
}
