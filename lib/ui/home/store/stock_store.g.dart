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

  late final _$particularSignalAtom = Atom(
    name: '_StockStore.particularSignal',
    context: context,
  );

  @override
  ParticularSignal get particularSignal {
    _$particularSignalAtom.reportRead();
    return super.particularSignal;
  }

  @override
  set particularSignal(ParticularSignal value) {
    _$particularSignalAtom.reportWrite(value, super.particularSignal, () {
      super.particularSignal = value;
    });
  }

  late final _$selectedProductTypeAtom = Atom(
    name: '_StockStore.selectedProductType',
    context: context,
  );

  @override
  ObservableList<String> get selectedProductType {
    _$selectedProductTypeAtom.reportRead();
    return super.selectedProductType;
  }

  @override
  set selectedProductType(ObservableList<String> value) {
    _$selectedProductTypeAtom.reportWrite(value, super.selectedProductType, () {
      super.selectedProductType = value;
    });
  }

  late final _$selectedOrderTypeAtom = Atom(
    name: '_StockStore.selectedOrderType',
    context: context,
  );

  @override
  ObservableList<String> get selectedOrderType {
    _$selectedOrderTypeAtom.reportRead();
    return super.selectedOrderType;
  }

  @override
  set selectedOrderType(ObservableList<String> value) {
    _$selectedOrderTypeAtom.reportWrite(value, super.selectedOrderType, () {
      super.selectedOrderType = value;
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

  late final _$getStockDetailAsyncAction = AsyncAction(
    '_StockStore.getStockDetail',
    context: context,
  );

  @override
  Future<void> getStockDetail(int id) {
    return _$getStockDetailAsyncAction.run(() => super.getStockDetail(id));
  }

  late final _$_StockStoreActionController = ActionController(
    name: '_StockStore',
    context: context,
  );

  @override
  void selectProduct(String product) {
    final _$actionInfo = _$_StockStoreActionController.startAction(
      name: '_StockStore.selectProduct',
    );
    try {
      return super.selectProduct(product);
    } finally {
      _$_StockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectOrder(String order) {
    final _$actionInfo = _$_StockStoreActionController.startAction(
      name: '_StockStore.selectOrder',
    );
    try {
      return super.selectOrder(order);
    } finally {
      _$_StockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
successMessage: ${successMessage},
errorMessage: ${errorMessage},
stockResponseModel: ${stockResponseModel},
particularSignal: ${particularSignal},
selectedProductType: ${selectedProductType},
selectedOrderType: ${selectedOrderType}
    ''';
  }
}
