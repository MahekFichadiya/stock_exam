import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';
import 'package:stock_management_exam/core/api/api_end_points.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_logout_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_sign_up_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/particular_signal.dart';
import 'package:stock_management_exam/data/model/response_model/stock_response_model/stock_response_model.dart';
import 'package:stock_management_exam/data/model/response_model/user_logout_response.dart';
import 'package:stock_management_exam/data/model/response_model/user_sign_up_response_model.dart';

part 'api_services.g.dart';

@RestApi()
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @POST(ApiEndPoints.signUpUrl)
  Future<UserSignUpResponseModel> signUpApi(@Body() UserSignUpRequestModel userResponseModel);

  @POST(ApiEndPoints.loginUrl)
  Future<UserSignUpResponseModel> loginApi(@Body() UserRequestModel userRequestModel);

  @GET(ApiEndPoints.getStockUrl)
  Future<StockResponseModel> getStocks();

  @GET("${ApiEndPoints.getStockUrl}/{id}")
  Future<ParticularSignal> getParticularSignal(@Path() int id);

  @POST(ApiEndPoints.logoutUrl)
  Future<UserLogoutResponse> logout(@Body() UserLogoutModel userLogoutModel);
}
