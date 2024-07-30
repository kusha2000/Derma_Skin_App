import 'package:derma_skin_app/consts/firebase_conts.dart';

class FirestoreServices {
  //get users data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
