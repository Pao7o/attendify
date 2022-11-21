import 'package:attendify/features/firebase/repository/firebase_authentication.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthController {
  final FirebaseAuthentication _firebaseAuthentication;

  FirebaseAuthController(this._firebaseAuthentication);

  Stream authStateChanges() {
    return _firebaseAuthentication.checkUserAuthState();
  }
}

final firebaseAutheControllerProvider = Provider((ref) {
  final authRepository = ref.watch(firebaseAuthenticationProvider);
  return FirebaseAuthController(authRepository);
});

final userAuthStateProvider = StreamProvider((ref) {
  return ref.watch(firebaseAutheControllerProvider).authStateChanges();
});
