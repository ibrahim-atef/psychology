class PatientInfoModel {
  String? displayName;

  String? email;
  String? profileUrl;
  String? phoneNumber;
  String? gender;
  String? uid;

  PatientInfoModel(
    this.displayName,
    this.uid,
    this.email,
    this.profileUrl,
    this.phoneNumber,
    this.gender,
  );

  Map<String, dynamic> toMap() {
    return {
      'displayName': this.displayName,
      'uid': this.uid,
      'email': this.email,
      'profileUrl': this.profileUrl,
      'phoneNumber': this.phoneNumber,
      'gender': this.gender,
    };
  }

factory  PatientInfoModel.fromMap(map) {
    return PatientInfoModel(
      map['displayName'],
      map['uid'],
      map['email'],
      map['profileUrl'],
      map['phoneNumber'],
      map['gender'],
    );
  }
}
