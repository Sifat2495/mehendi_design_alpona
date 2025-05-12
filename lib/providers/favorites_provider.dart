import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  FavoritesProvider() {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];

    _favorites = savedFavorites
        .map((e) => Map<String, String>.from({
      'title': e.split('|')[0],
      'imageUrl': e.split('|')[1],
    }))
        .toList();
    notifyListeners();
  }

  Future<void> addToFavorites(Map<String, String> design) async {
    final prefs = await SharedPreferences.getInstance();
    _favorites.add(design);
    final favoritesList = _favorites
        .map((e) => '${e['title']}|${e['imageUrl']}')
        .toList();  // Save the favorites list to SharedPreferences
    prefs.setStringList('favorites', favoritesList);
    notifyListeners();
  }

  Future<void> removeFromFavorites(Map<String, String> design) async {
    final prefs = await SharedPreferences.getInstance();
    _favorites.removeWhere((item) => item['title'] == design['title']);
    final favoritesList = _favorites
        .map((e) => '${e['title']}|${e['imageUrl']}')
        .toList();
    prefs.setStringList('favorites', favoritesList);
    notifyListeners();
  }

  bool isFavorite(Map<String, String> design) {
    return _favorites
        .any((item) => item['title'] == design['title']);
  }
}
