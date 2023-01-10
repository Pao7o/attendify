import 'package:attendify/features/firebase/models/app_user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseCloudFirestoreController {
  Future addNewUser(AppUser user) async {}
}

final firebaseCloudFirestoreControllerProvider = Provider((ref) {
  return FirebaseCloudFirestoreController();
});
