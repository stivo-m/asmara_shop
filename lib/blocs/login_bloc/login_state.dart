part of 'login_bloc.dart';

class LoginState {
  final LoginStatus status;

  LoginState({this.status = LoginStatus.IDLE});
}

class LoginInitial extends LoginState {
  final LoginStatus loginStatus;
  LoginInitial(this.loginStatus);
}

class LoginProcess extends LoginState {
  final FirebaseUser user;
  final LoginStatus status;

  LoginProcess({this.user, this.status});
}
