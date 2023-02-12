class ApiException implements Exception{
  int? statusCode;
  String? exceptionMessage;
  ApiException(this.statusCode,this.exceptionMessage);

}