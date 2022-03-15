import 'package:cloud_firestore/cloud_firestore.dart';

class PatientFireStoreMethods {
  Future<void> insertInfoFireStorage(String displayName, email, uid, profileUrl,
      phoneNumber, gender, collectionKey,isDoctor) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collectionKey);

    users.doc(uid).set({
      'displayName': displayName,
      'uid': uid,
      'email': email,
      "profileUrl": profileUrl,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "isDoctor": isDoctor,
    });
    return;
  }
}
