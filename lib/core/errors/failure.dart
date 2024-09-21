import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeout with api server');
      case DioExceptionType.cancel:
        return ServerFailure('Request with Api was canseld');
      case DioExceptionType.badResponse: // response
        return ServerFailure.fromResponce(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.connectionError: // other
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Interner Connection');
        }
        return ServerFailure('unExpected Error , please try later!');
      default:
        return ServerFailure('Opps There was an error');
    }
  }

  factory ServerFailure.fromResponce(int? statusCode, dynamic responce) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(responce['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error , please try later!');
    }
    return ServerFailure('Opps There was an error');
  }
}
