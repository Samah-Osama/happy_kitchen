import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessege;

  const Failure({required this.errorMessege});
}
class ServerFailure extends Failure {
  ServerFailure({required super.errorMessege});

  factory ServerFailure.fromDioException(DioException dioExep) {
    switch (dioExep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessege: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessege: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessege: 'Recive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessege: 'Bad SSL certificate error');
      case DioExceptionType.badResponse:
            // here i need to check on response and statuscode 
        return ServerFailure.fromRespose(
            dioExep.response!.statusCode!, dioExep.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessege: 'Request to ApiServer cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessege: 'There is no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessege: 'Unexcepted error , Please try again');
      default:
        return ServerFailure(
            errorMessege: 'Oops there is an error , Please try later');
    }
  }
  factory ServerFailure.fromRespose(int statusCode, jsonData) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errorMessege: jsonData['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessege: ' Internal Server Error , Please try later');
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessege: ' Your request not found , Please try later');
      //in this case i don't recive response aslan
    } else {
      return ServerFailure(
          errorMessege: 'Oops there is an error , Please try later');
    }
  }
}