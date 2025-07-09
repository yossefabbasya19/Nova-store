import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioExption(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: "connectionTimeout");
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: "sendTimeout");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: "receiveTimeout");
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: "badCertificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(dioException);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: "your Request is canceled");
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: "connectionError");
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: "try later");
    }
  }

  factory ServerFailure.fromBadResponse(DioException dioException) {
    if (dioException.response!.statusCode == 401 ||
        dioException.response!.statusCode == 409||
        dioException.response!.statusCode == 500
    ) {
      return ServerFailure(
          errorMessage:
              dioException.response?.data["message"] ?? dioException.message);
    } else if (dioException.response!.statusCode == 400) {
      return ServerFailure(
          errorMessage: dioException.response?.data["errors"]["param"]+" "+dioException.response?.data["errors"]["msg"] ??
              dioException.message);
    } else {
      return ServerFailure(
          errorMessage: dioException.message ?? 'please try later');
    }
  }
}
