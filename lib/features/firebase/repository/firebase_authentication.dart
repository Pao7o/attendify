import 'package:attendify/features/common/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> checkUserAuthState() {
    return _auth.authStateChanges();
  }

  Future<bool> signUpWithEmailAndPassword(
      {required BuildContext context,
      required String emailAddress,
      required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) async {
        await value.user!.sendEmailVerification().then((value) {
          return true;
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        Navigator.pop(context);
        Utils().errorDialog(
            context: context,
            error: 'The account already exists for that email.');
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

final firebaseAuthenticationProvider = Provider(((ref) {
  return FirebaseAuthentication();
}));
