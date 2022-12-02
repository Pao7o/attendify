import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream checkUserAuthState() {
    return _auth.authStateChanges();
  }

  Future<bool> signUpWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        return true;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }
}

final firebaseAuthenticationProvider = Provider(((ref) {
  return FirebaseAuthentication();
}));
