import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream checkUserAuthState() {
    return _auth.authStateChanges();
  }
}

final firebaseAuthenticationProvider = Provider(((ref) {
  return FirebaseAuthentication();
}));
