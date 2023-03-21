import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:stonkez/app/domain/entities/stock.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  Stock? searchedStock;

  @observable
  String? exceptionMessage;

  TextEditingController queryController = TextEditingController();

  @observable
  bool isFavorite = false;

  @observable
  bool isLoading = false;

  Timer? timer;

  @action
  void setIsFavorite() {
    isFavorite = true;
  }
}
