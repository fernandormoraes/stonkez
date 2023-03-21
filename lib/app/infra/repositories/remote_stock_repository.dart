import 'package:dio/dio.dart';
import 'package:stonkez/app/domain/entities/stock.dart';
import 'package:dartz/dartz.dart';
import 'package:stonkez/app/domain/repositories/stock_repository.dart';
import 'package:stonkez/app/infra/datasources/external/external_datasource.dart';
import 'package:stonkez/app/shared/exceptions/remote_exception.dart';

class RemoteStockRepository implements StockRepository {
  final ExternalHttpDatasource remoteHttpDatasource;

  RemoteStockRepository(this.remoteHttpDatasource);

  @override
  Future<Either<RemoteException, Stock>> getStockByName(
      String stockName) async {
    try {
      Map<String, dynamic> jsonData =
          await remoteHttpDatasource.get('/$stockName', null);

      return Right(Stock.fromJson(jsonData));
    } on DioError catch (ex) {
      return Left(RemoteException(ex.message));
    }
  }
}
