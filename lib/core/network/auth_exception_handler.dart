import 'package:flutter/material.dart';

class ExceptionModel {
  final String message;
  final int statusCode;
  final String errorCode;

  ExceptionModel({
    required this.message,
    required this.statusCode,
    required this.errorCode,
  });

  @override
  String toString() {
    return 'ExceptionModel(message: $message, statusCode: $statusCode, errorCode: $errorCode)';
  }
}

class SupanbaseExceptionHandler {
  static ExceptionModel parseException(String exception) {
    final messageRegex = RegExp(r'message:\s(.+?),');
    final statusCodeRegex = RegExp(r'statusCode:\s(\d+),');
    final errorCodeRegex = RegExp(r'errorCode:\s(\w+)\)');

    // Extract message
    final messageMatch = messageRegex.firstMatch(exception);
    final message =
        messageMatch != null ? messageMatch.group(1) : 'Unknown error';

    // Extract status code
    final statusCodeMatch = statusCodeRegex.firstMatch(exception);
    final statusCode = statusCodeMatch != null
        ? statusCodeMatch.group(1)
        : 'Unknown status code';

    // Extract error code
    final errorCodeMatch = errorCodeRegex.firstMatch(exception);
    final errorCode =
        errorCodeMatch != null ? errorCodeMatch.group(1) : 'Unknown error code';

    // debugPrint or return the extracted values

    debugPrint('Message: $message');
    debugPrint('Status Code: $statusCode');
    debugPrint('Error Code: $errorCode');
    return ExceptionModel(
      message: message ?? "Unknown error",
      statusCode: int.parse(statusCode ?? "Unknown status code"),
      errorCode: errorCode ?? "Unknown error code",
    );
  }

// void main() {
//   String ExceptionStr = "Exception(message: Password should be at least 8 characters. Password should contain at least one character of each: abcdefghijklmnopqrstuvwxyz, ABCDEFGHIJKLMNOPQRSTUVWXYZ, 0123456789., statusCode: 422, errorCode: weak_password)";
//   parseException(ExceptionStr);
// }
}
