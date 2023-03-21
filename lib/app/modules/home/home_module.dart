import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stonkez/app/app_module.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/domain/repositories/stock_repository.dart';
import 'package:stonkez/app/domain/usecases/add_favorite.dart';
import 'package:stonkez/app/domain/usecases/get_stock_by_name.dart';
import 'package:stonkez/app/domain/usecases/load_favorites.dart';
import 'package:stonkez/app/infra/datasources/external/external_datasource.dart';
import 'package:stonkez/app/infra/datasources/external/remote_http_datasource.dart';
import 'package:stonkez/app/infra/gateway/http_gateway.dart';
import 'package:stonkez/app/infra/repositories/remote_stock_repository.dart';
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
    Bind.lazySingleton<HomePresenter>((i) => HomePresenter()),
    Bind.lazySingleton<ExternalHttpDatasource>(
        (i) => RemoteHttpDatasource(i.get<IHttpGateway>())),
    Bind.lazySingleton(
        (i) => RemoteStockRepository(i.get<ExternalHttpDatasource>())),
    Bind.lazySingleton((i) => GetStockByName(i.get<StockRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
