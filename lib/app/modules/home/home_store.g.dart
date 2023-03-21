// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$searchedStockAtom =
      Atom(name: 'HomeStoreBase.searchedStock', context: context);

  @override
  Stock? get searchedStock {
    _$searchedStockAtom.reportRead();
    return super.searchedStock;
  }

  @override
  set searchedStock(Stock? value) {
    _$searchedStockAtom.reportWrite(value, super.searchedStock, () {
      super.searchedStock = value;
    });
  }

  late final _$exceptionMessageAtom =
      Atom(name: 'HomeStoreBase.exceptionMessage', context: context);

  @override
  String? get exceptionMessage {
    _$exceptionMessageAtom.reportRead();
    return super.exceptionMessage;
  }

  @override
  set exceptionMessage(String? value) {
    _$exceptionMessageAtom.reportWrite(value, super.exceptionMessage, () {
      super.exceptionMessage = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: 'HomeStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setIsFavorite() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIsFavorite');
    try {
      return super.setIsFavorite();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchedStock: ${searchedStock},
exceptionMessage: ${exceptionMessage},
isFavorite: ${isFavorite}
    ''';
  }
}
