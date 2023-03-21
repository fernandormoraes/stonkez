import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/domain/repositories/stock_repository.dart';
import 'package:stonkez/app/domain/usecases/get_stock_by_name.dart';
import 'package:stonkez/app/infra/datasources/external/external_datasource.dart';
import 'package:stonkez/app/infra/datasources/external/remote_http_datasource.dart';
import 'package:stonkez/app/infra/gateway/http_gateway.dart';
import 'package:stonkez/app/infra/repositories/remote_stock_repository.dart';
import 'package:stonkez/app/modules/favorites/favorites_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Dio>((i) => Dio()),
    Bind.singleton<IHttpGateway>((i) => HttpGateway(i.get<Dio>())),
    Bind.singleton<AppStore>((i) => AppStore()),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
    Bind.lazySingleton<ExternalHttpDatasource>(
        (i) => RemoteHttpDatasource(i.get<IHttpGateway>())),
    Bind.lazySingleton(
        (i) => RemoteStockRepository(i.get<ExternalHttpDatasource>())),
    Bind.lazySingleton((i) => GetStockByName(i.get<StockRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/favorites/', module: FavoritesModule())
  ];
}
