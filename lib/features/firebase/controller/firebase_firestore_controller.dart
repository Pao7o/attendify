import 'package:attendify/features/firebase/models/app_user_model.dart';

class FirebaseCloudFirestoreController {
  Future addNewUser(AppUser user) async {}
}

final firebaseCloudFirestoreControllerProvider = ((ref) {
  return FirebaseCloudFirestoreController();
});
