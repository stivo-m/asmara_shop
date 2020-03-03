import 'dart:async';

import 'package:asmara_shop/enums/login_state.dart';
import 'package:asmara_shop/utils/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial(LoginStatus.IDLE);

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginwithEmailandPassword) {
      yield LoginProcess(user: null, status: LoginStatus.PROCESSING);
      await auth.loginWithEmailandPassword(event.email, event.password).then(
        (FirebaseUser user) {
          user == null
              ? LoginProcess(user: null, status: LoginStatus.FAILED)
              : LoginProcess(user: auth.user, status: LoginStatus.SUCCESSFUL);
        },
      );
      yield LoginProcess(user: auth.user, status: LoginStatus.SUCCESSFUL);
    }
  }
}
