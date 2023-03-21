import 'package:shared_preferences/shared_preferences.dart';

class AddFavorite {
  final SharedPreferences sharedPreferences;

  const AddFavorite(this.sharedPreferences);

  void runUseCase(String stockName) {
    List<String>? favorites = sharedPreferences.getStringList('favorites');

    if (favorites == null) {
      sharedPreferences.setStringList('favorites', [stockName]);
    } else {
      if (favorites.contains(stockName)) {
        favorites.remove(stockName);
      } else {
        favorites.add(stockName);
      }

      sharedPreferences.setStringList('favorites', favorites);
    }
  }
}
