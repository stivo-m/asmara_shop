import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  Firestore db = Firestore.instance;
  FirebaseUser user;
  var errors;

  Future<FirebaseUser> loginWithEmailandPassword(
      String email, String password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (AuthResult authResult) {
          user = authResult.user;
        },
      ).catchError(
        (error) {
          errors = error;
          print("Errors: $error");
        },
      );
    } catch (e) {
      print("Caught Errors: $e");
    }
    return user;
  }

  Future<FirebaseUser> registerUserWithEmailAndPassword(
    String name,
    String email,
    String phoneNumber,
    String password,
  ) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (AuthResult authResult) async {
        user = authResult.user;

        UserUpdateInfo updateInfo = UserUpdateInfo();
        updateInfo.displayName = name;
        user.sendEmailVerification();
        await user.updateProfile(updateInfo);
        await user.reload();
        await updateUserInfo(user, name, phoneNumber);
      },
    );

    return user;
  }

  Future<void> updateUserInfo(
      FirebaseUser currentUser, String name, String phoneNumber) async {
    await db.collection("Users").document(currentUser.uid).setData(
      {
        "id": currentUser.uid,
        "email": currentUser.email,
        "name": name,
        "phoneNumber": phoneNumber,
      },
    );

    return currentUser;
  }
}

Auth auth = Auth();
