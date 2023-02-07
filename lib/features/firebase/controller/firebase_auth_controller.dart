import 'package:attendify/features/authentication/screens/email_verification_screen.dart';
import 'package:attendify/features/authentication/screens/phone_verification_screen.dart';
import 'package:attendify/features/authentication/screens/set_username_screen.dart';
import 'package:attendify/features/common/app_constants.dart';
import 'package:attendify/features/common/repository/shared_pref.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/features/firebase/controller/firebase_firestore_controller.dart';
import 'package:attendify/features/firebase/models/app_user.dart';

import 'package:attendify/features/firebase/repository/firebase_authentication.dart';
import 'package:attendify/screens/bottom_bar_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class FirebaseAuthController {
  final FirebaseAuthentication firebaseAuthentication;
  final FirebaseCloudFirestoreController firebaseCloudFirestoreController;

  FirebaseAuthController(
      {required this.firebaseAuthentication,
      required this.firebaseCloudFirestoreController});

  Stream authStateChanges() {
    return firebaseAuthentication.checkUserAuthState();
  }

  Future signupWithEmailandPassword(
      {required BuildContext context,
      required String email,
      required String password,
      required String firstName,
      required String lastName,
      required WidgetRef ref}) async {
    await InternetConnectionChecker().hasConnection.then((value) async {
      if (value) {
        return await firebaseAuthentication
            .signUpWithEmailAndPassword(
                context: context, emailAddress: email, password: password)
            .then((userCredential) async {
          AppUser appUser = AppUser(
              email: email,
              firstName: firstName,
              lastName: lastName,
              username: "",
              uid: userCredential!.user!.uid,
              phoneNumber: "",
              profilePhotoUrl: userCredential.user!.photoURL ?? "");
          await firebaseCloudFirestoreController
              .addNewUser(appUser)
              .then((value) async {
            await ref
                .read(sharedprefProvider)
                .saveObject(SHARED_PREFS_APP_USER_KEY, appUser)
                .then((value) async {
              await userCredential.user!.sendEmailVerification().then((value) {
                Navigator.pushNamed(context, EmailVerification.routeName,
                    arguments: email);
              });
            });
          });
        });
      } else {
        Navigator.pop(context);
        Utils().errorDialog(
            context: context,
            error: "Please check your connection and try again");
      }
    });
  }

  Future resendVerificationEmail() async {
    await firebaseAuthentication.resendEmailVerification();
  }

  Future signUpWithGoogle(
      {required BuildContext context, required WidgetRef ref}) async {
    print("sign up with google controller");
    await firebaseAuthentication.signInWithGoogle().then((credential) {
      signupSuccess(
          credential: credential, context: context, ref: ref, isPhone: false);
    });
  }

  void signupSuccess(
      {required UserCredential credential,
      required BuildContext context,
      required WidgetRef ref,
      required bool isPhone}) {
    AppUser appUser = AppUser(
        email: credential.user?.email ?? "",
        firstName: credential.user?.displayName?.split(" ")[0] ?? "",
        lastName: credential.user?.displayName?.split(" ")[1] ?? "",
        username: " ",
        uid: credential.user!.uid,
        phoneNumber: credential.user?.phoneNumber ?? "",
        profilePhotoUrl: credential.user!.photoURL ?? "");
    if (credential.additionalUserInfo!.isNewUser) {
      if (isPhone) {
        Navigator.pushNamedAndRemoveUntil(
            context, SetUsernameScreen.routeName, ((route) => false),
            arguments: appUser);
      } else {
        addUser(appUser, ref, context);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, BottomBarScreen.routeName, ((route) => false));
    }
  }

  void addUser(AppUser appUser, WidgetRef ref, BuildContext context) {
    firebaseCloudFirestoreController.addNewUser(appUser).then((value) async {
      await ref
          .read(sharedprefProvider)
          .saveObject(SHARED_PREFS_APP_USER_KEY, appUser)
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, BottomBarScreen.routeName, ((route) => false));
      });
    });
  }

  Future signInWithPhone(
      {required String phone,
      required BuildContext context,
      required WidgetRef ref}) async {
    await firebaseAuthentication.loginWithPhone(
        phoneNumber: phone,
        onCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuthentication.firebaseAuth
              .signInWithCredential(credential)
              .then((value) {
            signupSuccess(
                credential: value, context: context, ref: ref, isPhone: true);
          });
        },
        onFailed: (FirebaseAuthException exception) {
          Utils().errorDialog(context: context, error: exception.toString());
          print("Phone authentication error ${exception.toString()}");
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.pushNamed(context, PhoneVerificationScreen.routeName,
              arguments: {
                'verificationId': verificationId,
                "phoneNumber": phone
              });
        },
        codeTimeout: (String verificationId) {});
  }

  Future verifySms(
      {required BuildContext context,
      required String verificationId,
      required String smsCode,
      required WidgetRef ref}) async {
    await firebaseAuthentication
        .verifySms(verificationId: verificationId, smsCode: smsCode)
        .then((value) {
      firebaseAuthentication.firebaseAuth
          .signInWithCredential(value)
          .then((value) {
        signupSuccess(
            credential: value, context: context, ref: ref, isPhone: true);
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
