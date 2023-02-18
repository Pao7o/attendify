import 'package:attendify/features/common/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> checkUserAuthState() {
    return firebaseAuth.authStateChanges();
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      {required BuildContext context,
      required String emailAddress,
      required String password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
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

  Future<UserCredential?> signInWithEmailAndPassword(
      {required BuildContext context,
      required String emailAddress,
      required String password}) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils().errorDialog(
            context: context, error: "No user found for that email.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils().errorDialog(
            context: context, error: "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      Utils().errorDialog(context: context, error: e.toString());
      print("The error for sign up with email is ${e.toString()}");
    }
    return userCredential;
  }

  Future<bool> checkIfEmailIsVerified() async {
    bool isVerified = false;
    try {
      await firebaseAuth.currentUser!.reload().then((value) async {
        isVerified = firebaseAuth.currentUser?.emailVerified ?? false;
      });
    } catch (e) {
      print("Check if email is verified error is ${e.toString()}");
    }
    return isVerified;
  }

  Future resendEmailVerification() async {
    await firebaseAuth.currentUser!.sendEmailVerification();
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
    return await firebaseAuth.signInWithCredential(credential);
  }

  Future loginWithPhone({
    required String phoneNumber,
    required Function(PhoneAuthCredential credential) onCompleted,
    required Function(FirebaseAuthException exception) onFailed,
    required Function(String verificationId, int? resendToken) codeSent,
    required Function(String verificationId) codeTimeout,
  }) async {
    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: ((phoneAuthCredential) {
          onCompleted(phoneAuthCredential);
        }),
        verificationFailed: (FirebaseAuthException e) {
          onFailed(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId, resendToken);
        },
        codeAutoRetrievalTimeout: ((verificationId) {}));
  }

  Future<PhoneAuthCredential> verifySms(
      {required String verificationId, required String smsCode}) async {
    return PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
  }

  Future logOut() async {
    await firebaseAuth.signOut();
  }
}

final firebaseAuthenticationProvider = Provider(((ref) {
  return FirebaseAuthentication();
}));
