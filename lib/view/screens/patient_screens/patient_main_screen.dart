
import 'package:flutter/material.dart';
import 'package:psychology/controller/controllers/main_patient_controller.dart';

class PatientMainScreen extends StatelessWidget {
   PatientMainScreen({Key? key}) : super(key: key);

final controller=MainPatientController();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("mainPatientScreen"),
      ),
    );
  }
}
