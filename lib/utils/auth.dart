import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth;
  FirebaseUser user;

  Future<FirebaseUser> loginWithEmailandPassword(
      String email, String password) async {
    var _user;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (AuthResult authResult) {
        user = authResult.user;
        _user = authResult.user;
      },
    ).catchError((error) {
      print("Errors: $error");
    });
    return _user;
  }
}

Auth auth = Auth();
