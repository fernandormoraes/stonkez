import 'package:shared_preferences/shared_preferences.dart';
import 'package:stonkez/app/app_store.dart';

class LoadFavorites {
  final SharedPreferences sharedPreferences;
  final AppStore appStore;

  LoadFavorites(this.sharedPreferences, this.appStore);

  void runUseCase() {
    appStore.favoriteStocks =
        sharedPreferences.getStringList('favorites') ?? [];
  }
}
