import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/data/remote/api_services.dart';
import 'package:stock_management_exam/data/repository/repository.dart';

import '../model/response_model/user_response_model.dart';

class RepositoryImplementation implements Repository {
  final ApiServices apiServices;
  RepositoryImplementation({required this.apiServices});

  @override
  Future<UserResponseModel> signUp(UserResponseModel model) async {
    var result = await apiServices.signUpApi(model);
    return result;
  }

  @override
  Future<UserResponseModel> loginIn(UserRequestModel model) async {
    var result = await apiServices.loginApi(model);
    return result;
  }

  @override
  Future<StockResponseModel> getStock() async {
    var result = await apiServices.getStocks();
    return result;
  }
}
