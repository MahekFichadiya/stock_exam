import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';

import '../../../core/exception/dio_exception_api.dart';
import '../../../core/locator/locator.dart';
import '../../../data/repository_implementation/repository_implementation.dart';

part 'stock_store.g.dart';

class StockStore = _StockStore with _$StockStore;

abstract class _StockStore with Store {
  final RepositoryImplementation repository;
  _StockStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  String? successMessage;

  @observable
  String? errorMessage;

  @observable
  StockResponseModel stockResponseModel = StockResponseModel();

  @observable
  ParticularSignal particularSignal = ParticularSignal();

  @observable
  ObservableList<String> selectedProductType = ObservableList();

  @observable
  ObservableList<String> selectedOrderType = ObservableList();

  @action
  Future<void> getSignals() async {
    try {
      isLoading = true;
      var result = await repository.getStock();
      successMessage = result.message;
      stockResponseModel = result;
    } on DioException catch (e) {
      errorMessage = DioExceptionApi.handleError(e);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getStockDetail(int id) async {
    try {
      isLoading = true;
      var result = await repository.getParticularSignal(id);
      successMessage = result.message;
      particularSignal = result;
    } on DioException catch (e) {
      errorMessage = DioExceptionApi.handleError(e);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  void selectProduct(String product) {
    if (selectedProductType.contains(product)) {
      selectedProductType.remove(product);
    } else {
      selectedProductType.add(product);
    }
  }

  @action
  void selectOrder(String order) {
    if (selectedOrderType.contains(order)) {
      selectedOrderType.remove(order);
    } else {
      selectedOrderType.add(order);
    }
  }
}

var stockStore = locator<StockStore>();
