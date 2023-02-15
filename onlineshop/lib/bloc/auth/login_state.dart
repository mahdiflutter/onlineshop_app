import 'package:dartz/dartz.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginResponseState extends LoginState {
  Either<String, String>? response;
  LoginResponseState(this.response);
}
