import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  /// Current Index of bottom navigation page
  @observable
  int currentIndex = 0;

  /// Pre-loaded for performance purposes
  List<String> favoriteStocks = [];
}
