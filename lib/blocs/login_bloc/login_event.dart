part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginwithEmailandPassword extends LoginEvent {
  final String email, password;

  LoginwithEmailandPassword({
    this.email,
    this.password,
  });
}
