import 'dart:async';

import 'package:asmara_shop/enums/register.dart';
import 'package:asmara_shop/utils/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  @override
  SignupState get initialState =>
      SignupInitial(status: RegistrationStatus.IDLE);

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignUpWithCredentials) {
      FirebaseUser currentUser;
      yield SignUpStarted(status: RegistrationStatus.PROCESSING);
      await auth
          .registerUserWithEmailAndPassword(
        event.name,
        event.email,
        event.phoneNumber,
        event.password,
      )
          .then(
        (FirebaseUser user) {
          currentUser = user;
        },
      );

      yield currentUser == null
          ? SigUpFailed(RegistrationStatus.PROCESSING)
          : SignUpSuccess(
              user: currentUser, status: RegistrationStatus.SUCCESSFUL);
    }
  }
}
