import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/my_string.dart';

class FireStorageMethods {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  void uploadPatientImage(String uid, File file,
      String displayName, email,
      phoneNumber, gender, collectionKey, isDoctor) {
    storage
        .ref()
        .child(
            "$patientsCollectionKey/$uid/${Uri.file(file.path).pathSegments.last}")
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        PatientFireStoreMethods().insertInfoFireStorage(displayName, email, uid,
            value, phoneNumber, gender, collectionKey, isDoctor);
      }).catchError((onError) {
        print(onError);
      });
    }).catchError((error) {
      print("//////////////////////////////$error");
    });
  }
}
