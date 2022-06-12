import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String? dayDate;
  var appointmentCreationDate;
  bool? isTaken;
  String? patientName;
  String? patientImage;
  String? patientId;
  String? patientToken;
  String? startTime;
  String? endTime;
  String? price;

  AppointmentModel({
    required this.dayDate,
      this.appointmentCreationDate,
    required this.isTaken,
    required this.patientName,
    required this.patientImage,
    required this.patientId,
    required this.patientToken,
    required this.startTime,
    required this.endTime,
    required this.price,
  });

  Map<String, dynamic> toMap(AppointmentModel appointmentMap) {
    Map<String, dynamic> appointmentModel = Map();
    appointmentModel["dayDate"] = appointmentMap.dayDate;
    appointmentModel["appointmentCreationDate"] = appointmentMap.appointmentCreationDate;

     appointmentModel["isTaken"] = appointmentMap.isTaken;
    appointmentModel["patientName"] = appointmentMap.patientName;
    appointmentModel["patientImage"] = appointmentMap.patientImage;
    appointmentModel["patientId"] = appointmentMap.patientId;
    appointmentModel["patientToken"] = appointmentMap.patientToken;
    appointmentModel["startTime"] = appointmentMap.startTime;
    appointmentModel["endTime"] = appointmentMap.endTime;
    appointmentModel["price"] = appointmentMap.price;
    return appointmentModel;
  }
  factory AppointmentModel.fromMap(  map) {
    return AppointmentModel(
      dayDate: map['dayDate'] as String,
      appointmentCreationDate: map['appointmentCreationDate'] as Timestamp,
      isTaken: map['isTaken'] as bool,
      patientName: map['patientName'] as String,
      patientImage: map['patientImage'] as String,
      patientId: map['patientId'] as String,
      patientToken: map['patientToken'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      price: map['price'] as String,
     );
  }

  /// to map
}
