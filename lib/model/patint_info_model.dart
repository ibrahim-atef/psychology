import 'package:cloud_firestore/cloud_firestore.dart';

class PatientInfoModel {
  String? displayName;
  String? email;
  String? profileUrl;
  String? phoneNumber;
  String? gender;
  String? identityFile;
  Timestamp? registerDate;
  bool? isDoctor;
  String? uid;
  String? token;

  PatientInfoModel(
      this.displayName,
      this.uid,
      this.email,
      this.profileUrl,
      this.phoneNumber,
      this.gender,
      this.isDoctor,
      this.identityFile,
      this.registerDate,
      this.token);

  factory PatientInfoModel.fromMap(map) {
    return PatientInfoModel(
      map['displayName'],
      map['uid'],
      map['email'],
      map['profileUrl'],
      map['phoneNumber'],
      map['gender'],
      map['isDoctor'],
      map['identityFile'],
      map['registerDate'],
      map['token'],
    );
  }
}
