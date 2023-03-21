import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/domain/usecases/get_stock_by_name.dart';
import 'package:stonkez/app/modules/favorites/favorites_store.dart';
import 'package:stonkez/app/shared/extensions/either_extension.dart';

class FavoritesPresenter {
  final AppStore appStore = Modular.get<AppStore>();
  final FavoritesStore favoritesStore = Modular.get<FavoritesStore>();
  final GetStockByName getStockByName = Modular.get<GetStockByName>();

  void getStock(int favoriteIndex) {
    getStockByName
        .runUseCase(appStore.favoriteStocks[favoriteIndex])
        .then((value) {
      if (value.isRight()) favoritesStore.stock = value.asRight;
    });

    Modular.to.pushNamed(
        '/favorites/detail/${appStore.favoriteStocks[favoriteIndex]}');
  }
}
