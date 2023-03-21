import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/domain/entities/stock.dart';
import 'package:stonkez/app/domain/usecases/add_favorite.dart';
import 'package:stonkez/app/domain/usecases/get_stock_by_name.dart';
import 'package:stonkez/app/domain/usecases/load_favorites.dart';
import 'package:stonkez/app/modules/home/home_store.dart';
import 'package:stonkez/app/shared/extensions/either_extension.dart';

class HomePresenter {
  final HomeStore store = Modular.get<HomeStore>();
  final AppStore appStore = Modular.get<AppStore>();
  final GetStockByName getStockByName = Modular.get<GetStockByName>();
  late final AddFavorite addFavorite;
  late final LoadFavorites loadFavorites;

  HomePresenter() {
    Modular.isModuleReady().then((value) {
      Modular.getAsync<AddFavorite>().then((value) => addFavorite = value);
      Modular.getAsync<LoadFavorites>().then((value) {
        loadFavorites = value;
        loadFavorites.runUseCase();
      });
    });

    store.timer = Timer(const Duration(seconds: 5), () {
      updateStatusStock();
    });
  }

  Future<void> getStockByQuery(String query) async {
    try {
      store.searchedStock = null;

      store.isLoading = true;

      Either<String, Stock> returnedUseCase =
          await getStockByName.runUseCase(query);

      if (returnedUseCase.isRight()) {
        store.searchedStock = returnedUseCase.asRight;
      } else {
        store.exceptionMessage = returnedUseCase.asLeft;
      }

      isStockFavorite();
    } finally {
      store.isLoading = false;
    }
  }

  Future<void> updateStatusStock() async {
    if (store.queryController.text.isNotEmpty && store.searchedStock != null) {
      Either<String, Stock> returnedUseCase =
          await getStockByName.runUseCase(store.queryController.text);

      if (returnedUseCase.isRight()) {
        store.searchedStock = returnedUseCase.asRight;
      }
    }

    store.timer = Timer(const Duration(seconds: 5), () {
      updateStatusStock();
    });
  }

  Future<void> addNewFavorite() async {
    await Modular.isModuleReady();
    addFavorite.runUseCase(store.queryController.text);
    loadFavorites.runUseCase();
    isStockFavorite();
  }

  void isStockFavorite() {
    if (appStore.favoriteStocks.contains(store.queryController.text)) {
      store.setIsFavorite();
    } else {
      store.isFavorite = false;
    }
  }
}
