import 'package:attendify/features/authentication/screens/email_verification_screen.dart';
import 'package:attendify/features/common/repository/shared_pref.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/features/firebase/controller/firebase_firestore_controller.dart';
import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:attendify/features/firebase/repository/firebase_authentication.dart';
import 'package:attendify/screens/bottom_bar_screen.dart';
import 'package:attendify/utils/app_constants.dart';
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

  Future signUpWithGoogle(BuildContext context) async {
    print("sign up with google controller");
    await firebaseAuthentication.signInWithGoogle().then((credential) {
      if (credential.additionalUserInfo!.isNewUser) {
        firebaseCloudFirestoreController
            .addNewUser(AppUser(
                email: credential.user?.email ?? "",
                firstName: credential.user?.displayName?[0] ?? "",
                lastName: credential.user?.displayName?[1] ?? "",
                username: " ",
                uid: credential.user!.uid,
                phoneNumber: '',
                profilePhotoUrl: credential.user!.photoURL ?? ""))
            .then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBarScreen.routeName, ((route) => false));
        });
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, BottomBarScreen.routeName, ((route) => false));
      }
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
