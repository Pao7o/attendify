import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:attendify/features/firebase/repository/firebase_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseCloudFirestoreController {
  final FirebaseCloudFirestore firebaseCloudFirestore;

  FirebaseCloudFirestoreController({required this.firebaseCloudFirestore});
  Future addNewUser(AppUser user) async {
    await firebaseCloudFirestore.addNewUser(user);
  }
}

final firebaseCloudFirestoreControllerProvider = Provider((ref) {
  return FirebaseCloudFirestoreController(
      firebaseCloudFirestore: ref.watch(firebaseCloudFirestoreProvider));
});
