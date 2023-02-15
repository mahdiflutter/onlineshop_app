import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/auth/login_event.dart';
import 'package:onlineshop/bloc/auth/login_state.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/services/repository/authentication_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static final IAuthenticationRepository _repository = locator.get();
  LoginBloc() : super(LoginInitState()) {
    on<LoginSendRequestEvent>(
      (event, emit) async {
        emit(LoginLoadingState());
        var response =
            await _repository.login(event.identity!, event.password!);
        emit(LoginResponseState(response));
      },
    );
  }
}
