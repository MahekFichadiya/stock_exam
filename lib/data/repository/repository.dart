import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';

import '../model/response_model/user_response_model.dart';

abstract class Repository {
  //auth api
  Future<UserResponseModel> signUp(UserResponseModel model);
  Future<UserResponseModel> loginIn(UserRequestModel model);

  //stock api
  Future<StockResponseModel> getStock();
}
