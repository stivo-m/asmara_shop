part of 'signup_bloc.dart';

@immutable
class SignupState {
  final RegistrationStatus status;

  SignupState({this.status = RegistrationStatus.IDLE});
}

class SignupInitial extends SignupState {
  final RegistrationStatus status;
  SignupInitial({this.status});
}

class SignUpStarted extends SignupState {
  final RegistrationStatus status;
  SignUpStarted({this.status});
}

class SignUpSuccess extends SignupState {
  final FirebaseUser user;
  final RegistrationStatus status;

  SignUpSuccess({this.user, this.status});
}

class SigUpFailed extends SignupState {
  final RegistrationStatus status;

  SigUpFailed(this.status);
}
