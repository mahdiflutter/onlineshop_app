abstract class LoginEvent {}

class LoginSendRequestEvent extends LoginEvent {
  String? identity;
  String? password;
  LoginSendRequestEvent(
    this.identity,
    this.password,
  );
}
