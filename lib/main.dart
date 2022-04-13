import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:psychology/routes/routes.dart';
import 'package:flutter/services.dart';
import 'package:psychology/utils/my_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
  //please help me
  //afroto
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: GetStorage().read("auth") == patientsCollectionKey
          ? Routes.patientMainScreen
          : GetStorage().read("auth") == doctorsCollectionKey
              ? Routes.doctorMainScreen
              : Routes.SplashScreen,
      getPages: AppRoutes.routes,

      //Fraon
    );
  }
}
