import 'package:dartz/dartz.dart';
import 'package:stonkez/app/domain/entities/stock.dart';
import 'package:stonkez/app/shared/exceptions/remote_exception.dart';

/// A Repository for get [Stock] data
abstract class StockRepository {
  /// Receives a `stockName`
  ///
  /// Returns Either a [RemoteException] if request fails or a [Stock] if success
  Future<Either<RemoteException, Stock>> getStockByName(String stockName);
}
