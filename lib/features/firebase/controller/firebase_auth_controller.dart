import 'package:attendify/features/authentication/screens/email_verification_screen.dart';
import 'package:attendify/features/firebase/controller/firebase_firestore_controller.dart';
import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:attendify/features/firebase/repository/firebase_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthController {
  final FirebaseAuthentication firebaseAuthentication;
  final FirebaseCloudFirestoreController firebaseCloudFirestoreController;

  FirebaseAuthController(
      {required this.firebaseAuthentication,
      required this.firebaseCloudFirestoreController});

  Stream authStateChanges() {
    return firebaseAuthentication.checkUserAuthState();
  }

  Future signupWithEmailandPassword({
    required BuildContext context,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return await firebaseAuthentication
        .signUpWithEmailAndPassword(
            context: context, emailAddress: email, password: password)
        .then((userCredential) async {
      await firebaseCloudFirestoreController
          .addNewUser(AppUser(
              email: email,
              firstName: firstName,
              lastName: lastName,
              username: "",
              uid: userCredential!.user!.uid,
              phoneNumber: ""))
          .then((value) async {
        await userCredential.user!.sendEmailVerification().then((value) {
          Navigator.pushNamed(context, EmailVerification.routeName,
              arguments: email);
        });
      });
    });
  }

  Future<bool> checkIfEmailVerified() async {
    return await firebaseAuthentication.checkIfEmailIsVerified();
  }

  Future logout() async {
    await firebaseAuthentication.logOut();
  }
}

final firebaseAutheControllerProvider = Provider((ref) {
  final authRepository = ref.watch(firebaseAuthenticationProvider);
  final firestoreController =
      ref.watch(firebaseCloudFirestoreControllerProvider);
  return FirebaseAuthController(
      firebaseAuthentication: authRepository,
      firebaseCloudFirestoreController: firestoreController);
});

final userAuthStateProvider = StreamProvider((ref) {
  return ref.watch(firebaseAutheControllerProvider).authStateChanges();
});
