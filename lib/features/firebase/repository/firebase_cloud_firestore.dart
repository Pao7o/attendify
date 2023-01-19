import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:attendify/utils/app_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseCloudFirestore {
  var db = FirebaseFirestore.instance;

  Future addNewUser(AppUser user) async {
    try {
      db.collection(USERS_DATABASE).doc(user.uid).set(user.toMap());
    } catch (e) {
      print("Add new user error ${e.toString()}");
    }
  }
}

final firebaseCloudFirestoreProvider = Provider(((ref) {
  return FirebaseCloudFirestore();
}));
