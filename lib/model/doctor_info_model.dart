import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorInfo {
  final String? displayName;
  final String? uid;
  final String? email;
  final String? profileUrl;
  final String? identityFile;
  final Timestamp? registerDate;
  final bool? isDoctor;
  final String? phoneNumber;
  final String? gender;

  DoctorInfo(
    this.displayName,
    this.uid,
    this.email,
    this.profileUrl,
    this.identityFile,
    this.registerDate,
    this.isDoctor,
    this.phoneNumber,
    this.gender,
  );

  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'displayName': this.displayName,
  //     'uid': this.uid,
  //     'email': this.email,
  //     'profileUrl': this.profileUrl,
  //     'identityFile': this.identityFile,
  //     'registerDate': this.registerDate,
  //     'isDoctor': this.isDoctor,
  //     'phoneNumber': this.phoneNumber,
  //     'gender': this.gender,
  //   };
  // }

  factory DoctorInfo.fromJson(map) {
    return DoctorInfo(
      map['displayName'],
      map['uid'] ,
      map['email'] ,
      map['profileUrl'] ,
      map['identityFile'],
      map['registerDate'] ,
      map['isDoctor'] ,
      map['phoneNumber'],
      map['gender'] ,
    );
  }
}
