import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:stock_management_exam/core/exception/dio_exception_api.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_sign_up_request_model.dart';
import 'package:stock_management_exam/data/model/response_model/user_sign_up_response_model.dart';
import 'package:stock_management_exam/data/repository/repository.dart';
import 'package:stock_management_exam/data/repository_implementation/repository_implementation.dart';

import '../../../core/locator/locator.dart';
import '../../../data/model/response_model/user_response_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final RepositoryImplementation repository;
  _AuthStore({required this.repository});

  @observable
  bool isLoading = false;

  @observable
  String? successMessage;

  @observable
  String? errorMessage;

  @observable
  UserSignUpResponseModel? userResponseModel;

  @action
  Future<bool> signUp(UserSignUpRequestModel model) async {
    try {
      var result = await repository.signUp(model);
      userResponseModel = result;
      successMessage = result.message;
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptionApi.handleError(e);
    } catch (e) {
      errorMessage = e.toString();
    }
    return false;
  }

  @action
  Future<bool> login(UserRequestModel model) async {
    try {
      var result = await repository.loginIn(model);
      userResponseModel = result;
      successMessage = result.message;
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptionApi.handleError(e);
    } catch (e) {
      errorMessage = e.toString();
    }
    return false;
  }

  @action
  Future<bool> logout(int id) async {
    try {
      var result = await repository.logout(id);
      successMessage = result.message;
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptionApi.handleError(e);
    } catch (e) {
      errorMessage = e.toString();
    }
    return false;
  }
}

var authStore = locator<AuthStore>();
