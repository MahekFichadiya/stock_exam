import 'dart:io';

import 'package:dio/dio.dart';

import '../../generated/l10n.dart';

class DioExceptionApi {
  static String handleError(DioException error) {
    String errorString = S.current.unknownError;

    switch (error.type) {
      case DioExceptionType.unknown:
        errorString = S.current.unknownError;
        if (error.error == SocketException) {
          errorString = S.current.requestCantHandleNowTryAfterSomeTime;
        }
        break;
      case DioExceptionType.cancel:
        errorString = S.current.requestIsCanceledFromTheServer;
        break;
      case DioExceptionType.connectionError:
        errorString = S.current.connectionTimedOutFromTheServer;
        break;
      case DioExceptionType.receiveTimeout:
        errorString = S.current.receivedTimeOut;
        break;
      case DioExceptionType.sendTimeout:
        errorString = S.current.sendTimeOut;
        break;
      case DioExceptionType.badResponse:
        if (error.response!.statusCode == 401) {
          errorString = error.response!.statusMessage!;
        } else if (error.response!.statusCode == 404) {
          errorString = error.response!.statusMessage!;
        } else if (error.response!.statusCode == 409) {
          errorString = error.response!.statusMessage!;
        } else if (error.response!.statusCode == 429) {
          errorString = error.response!.statusMessage!;
        } else if (error.response!.statusCode == 500) {
          errorString = error.response!.statusMessage!;
        } else if (error.response!.statusCode == 502) {
          errorString = error.response!.statusMessage!;
        }
        break;
      default:
        errorString = "${error.response!.statusCode} ${S.current.requestCantHandleNowTryItAfterSomeTime}";
    }

    return errorString;
  }
}
