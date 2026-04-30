import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_sign_up_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/data/model/response_model/user_sign_up_response_model.dart';

import '../model/response_model/user_logout_response.dart';

abstract class Repository {
  //auth api
  Future<UserSignUpResponseModel> signUp(UserSignUpRequestModel model);
  Future<UserSignUpResponseModel> loginIn(UserRequestModel model);
  Future<UserLogoutResponse> logout(int id);

  //stock api
  Future<StockResponseModel> getStock();
  Future<ParticularSignal> getParticularSignal(int id);
}
