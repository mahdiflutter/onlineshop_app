class ApiException implements Exception {
  int? statusCode;
  String? errorMessage;
  ApiException(
    this.statusCode,
    this.errorMessage,
  );
}
