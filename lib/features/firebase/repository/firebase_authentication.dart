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

  Future<UserCredential?> signUpWithEmailAndPassword(
      {required BuildContext context,
      required String emailAddress,
      required String password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Navigator.pop(context);
        Utils().errorDialog(
            context: context,
            error: 'The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("The error for sign up with email is ${e.toString()}");
    }
    return userCredential;
  }

  Future checkIfEmailIsVerified() async {
    bool isVerified = false;
    try {
      await _auth.currentUser!.reload().then((value) async {
        isVerified = _auth.currentUser?.emailVerified ?? false;
      });
    } catch (e) {
      print("Check if email is verified error is ${e.toString()}");
    }
    return isVerified;
  }

  Future resendEmailVerification() async {
    await _auth.currentUser!.sendEmailVerification();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    print("sign in with google triggered");
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
    return await _auth.signInWithCredential(credential);
  }

  Future logOut() async {
    await _auth.signOut();
  }
}

final firebaseAuthenticationProvider = Provider(((ref) {
  return FirebaseAuthentication();
}));
