part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignUpWithCredentials extends SignupEvent {
  final String email, password, name, phoneNumber;

  SignUpWithCredentials(
    this.email,
    this.password,
    this.name,
    this.phoneNumber,
  );
}
