class PatientInfoModel {
  String? displayName;
  String? uid;
  String? email;
  String? profileUrl;
  String? phoneNumber;
  String ? gender;

  PatientInfoModel({
    this.displayName,
    this.uid,
    this.email,
    this.profileUrl,
    this.phoneNumber,
    this.gender,
  });

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

  factory PatientInfoModel.fromMap(Map<String, dynamic> map) {
    return PatientInfoModel(
      displayName: map['displayName'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      profileUrl: map['profileUrl'] as String,
      phoneNumber: map['phoneNumber'] as String,
      gender: map['gender'] as String,
    );
  }
}
