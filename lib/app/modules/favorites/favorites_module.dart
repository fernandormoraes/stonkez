import 'package:stonkez/app/modules/favorites/favorites_page.dart';
import 'package:stonkez/app/modules/favorites/favorites_presenter.dart';
import 'package:stonkez/app/modules/favorites/favorites_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/modules/favorites/pages/favorites_detail_page.dart';

class FavoritesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<FavoritesStore>((i) => FavoritesStore()),
    Bind.lazySingleton<FavoritesPresenter>((i) => FavoritesPresenter())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const FavoritesPage()),
    ChildRoute('/detail/:stockName',
        child: (_, args) => FavoritesDetailPage(
              stockName: args.params['stockName'],
            ))
  ];
}
