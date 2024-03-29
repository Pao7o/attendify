import 'package:attendify/features/common/app_constants.dart';
import 'package:attendify/features/firebase/models/app_user.dart';
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

  Future<DocumentSnapshot?> getUser(String uid) async {
    try {
      return await db.collection(USERS_DATABASE).doc(uid).get();
    } catch (e) {
      print("Get user error is ${e.toString()}");
      return null;
    }
  }
}

final firebaseCloudFirestoreProvider = Provider(((ref) {
  return FirebaseCloudFirestore();
}));
