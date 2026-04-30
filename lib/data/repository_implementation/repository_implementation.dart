import 'package:stock_management_exam/data/model/request_model/user_request_model/user_logout_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_sign_up_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/data/model/response_model/user_sign_up_response_model.dart';
import 'package:stock_management_exam/data/remote/api_services.dart';
import 'package:stock_management_exam/data/repository/repository.dart';

import '../model/response_model/user_logout_response.dart';

class RepositoryImplementation implements Repository {
  final ApiServices apiServices;
  RepositoryImplementation({required this.apiServices});

  @override
  Future<UserSignUpResponseModel> signUp(UserSignUpRequestModel model) async {
    var result = await apiServices.signUpApi(model);
    var response = UserSignUpResponseModel(message: result.message, code: result.code, data: result.data);
    return response;
  }

  @override
  Future<UserSignUpResponseModel> loginIn(UserRequestModel model) async {
    var result = await apiServices.loginApi(model);
    var response = UserSignUpResponseModel(data: result.data, code: result.code, message: result.message);
    return response;
  }

  @override
  Future<StockResponseModel> getStock() async {
    var result = await apiServices.getStocks();
    return result;
  }

  @override
  Future<ParticularSignal> getParticularSignal(int id) async {
    var result = await apiServices.getParticularSignal(id);
    return result;
  }

  @override
  Future<UserLogoutResponse> logout(int id) async {
    var data = UserLogoutModel(userId: id);
    var result = await apiServices.logout(data);
    var response = UserLogoutResponse(message: result.message, code: result.code);
    return response;
  }
}
