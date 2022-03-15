import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/my_string.dart';

class FireStorageMethods {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  void uploadPatientImageAndInfo(String uid, File file, String displayName,
      email, phoneNumber, gender, isDoctor) {
    storage
        .ref()
        .child(
            "$patientsCollectionKey/$uid/${Uri.file(file.path).pathSegments.last}")
        .putFile(file)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        FireStoreMethods().insertPatientInfoFireStorage(
            displayName, email, uid, value, phoneNumber, gender, isDoctor);
      }).catchError((onError) {
        print(onError);
      });
    }).catchError((error) {
      print("//////////////////////////////$error");
    });
  }

  void uploadDoctorImageAndInfo(String uid, profileUrl, identityFile,
      String displayName, email, phoneNumber, gender, isDoctor) {
    storage
        .ref()
        .child(
            "$doctorsCollectionKey/$uid/profileImage/${Uri.file(profileUrl.path).pathSegments.last}")
        .putFile(profileUrl)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        FireStoreMethods()
            .insertDoctorInfoFireStorage(displayName, email, uid, value,
                "identityFile", phoneNumber, gender, isDoctor)
            .then((value) {
          updateDoctorIdentityStorage(uid, identityFile);
        });
      }).catchError((onError) {
        print(onError);
      });
    }).catchError((error) {
      print("//////////////////////////////$error");
    });
  }

  updateDoctorIdentityStorage(uid, identityFile) {
    storage
        .ref()
        .child(
            "$doctorsCollectionKey/$uid/identityFile/${Uri.file(identityFile.path).pathSegments.last}")
        .putFile(identityFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        FireStoreMethods().updateDoctorIdentity(uid, value);
      }).catchError((onError) {
        print(onError);
      });
    }).catchError((onError) {
      print(onError);
    });
  }
}
