// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StockStore on _StockStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_StockStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$successMessageAtom = Atom(
    name: '_StockStore.successMessage',
    context: context,
  );

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_StockStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$stockResponseModelAtom = Atom(
    name: '_StockStore.stockResponseModel',
    context: context,
  );

  @override
  StockResponseModel get stockResponseModel {
    _$stockResponseModelAtom.reportRead();
    return super.stockResponseModel;
  }

  @override
  set stockResponseModel(StockResponseModel value) {
    _$stockResponseModelAtom.reportWrite(value, super.stockResponseModel, () {
      super.stockResponseModel = value;
    });
  }

  late final _$getSignalsAsyncAction = AsyncAction(
    '_StockStore.getSignals',
    context: context,
  );

  @override
  Future<void> getSignals() {
    return _$getSignalsAsyncAction.run(() => super.getSignals());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
successMessage: ${successMessage},
errorMessage: ${errorMessage},
stockResponseModel: ${stockResponseModel}
    ''';
  }
}
