import 'package:mobx/mobx.dart';
import 'package:stonkez/app/domain/entities/stock.dart';

part 'favorites_store.g.dart';

class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  @observable
  Stock? stock;
}
