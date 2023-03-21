import 'package:dartz/dartz.dart';
import 'package:stonkez/app/domain/entities/stock.dart';
import 'package:stonkez/app/domain/repositories/stock_repository.dart';
import 'package:stonkez/app/shared/exceptions/remote_exception.dart';
import 'package:stonkez/app/shared/extensions/either_extension.dart';

/// A UseCase for user who wants to search for a [Stock]
///
/// Returns a [Stock] if success
///
/// Returns a [String] containing a error message if some [RemoteException] occurs in [StockRepository]
class GetStockByName {
  final StockRepository stockRepository;

  GetStockByName(this.stockRepository);

  Future<Either<String, Stock>> runUseCase(String stockName) async {
    Either<RemoteException, Stock> returnedData =
        await stockRepository.getStockByName(stockName);

    if (returnedData.isRight()) {
      return Right(returnedData.asRight);
    } else {
      return const Left("Stock not found");
    }
  }
}
