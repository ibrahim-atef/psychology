import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psychology/utils/my_string.dart';

class FireStoreMethods {
  CollectionReference doctors =
      FirebaseFirestore.instance.collection(doctorsCollectionKey);
  CollectionReference patients =
      FirebaseFirestore.instance.collection(patientsCollectionKey);

  Future<void> insertPatientInfoFireStorage(String displayName, email, uid,
      profileUrl, phoneNumber, gender, isDoctor) async {
    patients.doc(uid).set({
      'displayName': displayName,
      'uid': uid,
      'email': email,
      "profileUrl": profileUrl,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "registerDate": DateTime.now()
    });
    return;
  }

  Future<void> insertDoctorInfoFireStorage(String displayName, email, uid,
      profileUrl, identityFile, phoneNumber, gender, isDoctor) async {
    doctors.doc(uid).set({
      'displayName': displayName,
      'uid': uid,
      'email': email,
      "profileUrl": profileUrl,
      "identityFile": identityFile,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "isDoctor": isDoctor,
      "registerDate": DateTime.now()
    });
    return;
  }

  Future<void> updateDoctorIdentity(uid, identityFilrUrl) {
    return doctors
        .doc(uid)
        .update({'identityFile': identityFilrUrl})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update doctor Image: $error"));
  }


}
