import 'package:attendify/features/firebase/models/app_user.dart';
import 'package:attendify/features/firebase/repository/firebase_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseCloudFirestoreController {
  final FirebaseCloudFirestore firebaseCloudFirestore;

  FirebaseCloudFirestoreController({required this.firebaseCloudFirestore});
  Future addNewUser(AppUser user) async {
    await firebaseCloudFirestore.addNewUser(user);
  }

  Future<AppUser?> getCurrentUser() async {
    AppUser? user;
    String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    await firebaseCloudFirestore.getUser(currentUserUid).then((value) {
      user = AppUser.fromMap(value!.data() as Map<String, dynamic>);
    });

    return user;
  }
}

final firebaseCloudFirestoreControllerProvider = Provider((ref) {
  return FirebaseCloudFirestoreController(
      firebaseCloudFirestore: ref.watch(firebaseCloudFirestoreProvider));
});
