import 'package:dartz/dartz.dart';

extension EitherExtension<L, R> on Either<L, R> {
  L get asLeft =>
      fold((L l) => l, (R r) => throw Exception("Either is a Right"));

  R get asRight =>
      fold((L l) => throw Exception("Either is a Left"), (R r) => r);
}
