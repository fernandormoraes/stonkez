import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stonkez/app/app_module.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/domain/usecases/add_favorite.dart';
import 'package:stonkez/app/domain/usecases/load_favorites.dart';
import 'package:stonkez/app/modules/home/home_presenter.dart';
import 'home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    AsyncBind<AddFavorite>((i) async {
      await Modular.isModuleReady<AppModule>();

      final SharedPreferences preferences =
          await Modular.getAsync<SharedPreferences>();

      return AddFavorite(preferences);
    }),
    AsyncBind<LoadFavorites>((i) async {
      await Modular.isModuleReady<AppModule>();

      final SharedPreferences preferences =
          await Modular.getAsync<SharedPreferences>();

      return LoadFavorites(preferences, i.get<AppStore>());
    }),
    Bind.lazySingleton<HomeStore>((i) => HomeStore()),
    Bind.lazySingleton<HomePresenter>((i) => HomePresenter())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
