import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/services/firestorage_methods.dart';
import 'package:psychology/services/firestore_methods.dart';
import 'package:psychology/utils/constants.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GetStorage authBox = GetStorage();
  var googleSignin = GoogleSignIn();
  var displayUserName = ''.obs;
  var displayUserPhoto = "".obs;
  var displayUserEmail = "".obs;
  var patientGender = "".obs;

  var isSignedIn = false;

  //////////////////////////////get doctor Identity///////////////////////////////

  File? identityImage;

  getIdentityImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      identityImage = File(pickedFile.path);
      update();
    } else {
      print("No identity Selected");
    }
    update();
  }

  ////////////////////////////getting user image//////////////////////////////////////////////////

  final ImagePicker picker = ImagePicker();
  File? profileImage;

  getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      update();
    } else {
      print("No Image Selected");
    }
    update();
  }

//////////////////////////////////ال sign up patient//////////////////////////////////////////////////////////////////////////
  void patientSignUpUsingFirebase({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
        // PatientFireStoreMethods().insertInfoFireStorage(
        //     name,
        //     email,
        //     value.user!.uid,
        //     "profileUrl",
        //     phoneNumber,
        //     patientGender.value,
        //     patientsCollectionKey,
        //     false);
        FireStorageMethods().uploadPatientImageAndInfo(
            value.user!.uid,
            profileImage!,
            name,
            email,
            phoneNumber,
            patientGender.value,
            false);
      });

      update();
      Get.offNamed(Routes.patientMainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'weak-password') {
        message = "password is too weak.";
        title = error.code.toString();

        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        message = "account already exists ";

        print('The account already exists for that email.');
      } else {
        message = error.message.toString();
      }

      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
      // Get.snackbar(
      //   title,
      //   message,
      //   snackPosition: SnackPosition.TOP,
      // );
    } catch (error) {
      Get.snackbar(
        "Error",
        "$error",
        snackPosition: SnackPosition.TOP,
      );
      print(error);
    }
  }

  //////////////////////////////////ال sign up doctor//////////////////////////////////////////////////////////////////////////

  void doctorSignUpUsingFirebase({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
        FireStorageMethods().uploadDoctorImageAndInfo(
            value.user!.uid,
            profileImage!,
            identityImage!,
            name,
            email,
            phoneNumber,
            patientGender.value,
            false);
      });

      update();
      Get.offNamed(Routes.patientMainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'weak-password') {
        message = "password is too weak.";
        title = error.code.toString();

        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        message = "account already exists ";

        print('The account already exists for that email.');
      } else {
        message = error.message.toString();
      }

      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
      // Get.snackbar(
      //   title,
      //   message,
      //   snackPosition: SnackPosition.TOP,
      // );
    } catch (error) {
      Get.snackbar(
        "Error",
        "$error",
        snackPosition: SnackPosition.TOP,
      );
      print(error);
    }
  }

  /////////////////////////////////////////check doctor or patient auth////////////////////////////////////////
  void checkDoctorOrPatientAuth() {
    Get.defaultDialog(
        title: "Login",
        middleText: "Register as?",
        // textCancel: "Doctor",
        // textConfirm: "Patient",
        // onCancel: () async{
        //       Get.back();
        //       gotodoctor();
        //   await Get.toNamed(Routes.doctorRegisterScreen);
        //
        //   update();

        //    },
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
                Get.toNamed(Routes.doctorRegisterScreen);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: mainColor2,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "Doctor",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: mainColor2),
                ),
              )),
          TextButton(
              onPressed: () {
                Get.back();
                googleSignupApp();
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: mainColor2,
                    width: 2,
                  ),
                ),
                child: const Text(
                  "Patient",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, color: mainColor2),
                ),
              )),
        ],
        // onConfirm: () {
        //   googleSignupApp();
        // },
        buttonColor: mainColor2,
        titleStyle: TextStyle(color: mainColor2),
        middleTextStyle: TextStyle(color: mainColor2),
        cancelTextColor: mainColor2,
        confirmTextColor: white,
        backgroundColor: white);
  }

//////////////////////////////////////////////////////////////////////login with firebase///////////////////////////

  void loginUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      // .then((value) =>
      // displayUserName.value = auth.currentUser!.displayName!);
      // isSignedIn = true;
      // authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.patientMainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'user-not-found') {
        message =
        "Account does not exists for that $email.. Create your account by signing up..";
      } else if (error.code == 'wrong-password') {
        message = "Invalid Password... PLease try again!";
      } else {
        message = error.message.toString();
      }
      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
    } catch (error) {
      Get.defaultDialog(
          title: "error",
          middleText: "$error",
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
      print(error);
    }
  }

//////////////////////////////////////////////////////////////////////login with google///////////////////////////

  Future googleSignupApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignin.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      final GoogleSignInAuthentication? googleAuth =
      await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await auth.signInWithCredential(credential).then((value) {
        FireStoreMethods().insertPatientInfoFireStorage(
            value.user!.displayName!,
            value.user!.email,
            value.user!.uid,
            value.user!.photoURL,
            value.user!.phoneNumber,
            "",
            false);
      });

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.patientMainScreen);
    } catch (error) {
      Get.defaultDialog(
          title: "error",
          middleText: "$error",
          textCancel: "Ok",
          buttonColor: mainColor2,
          cancelTextColor: mainColor,
          backgroundColor: white);
      print("1111111111111111111111111111111111111111111$error");
    }
  }

  //////////////////////////////////////////////////////////////////////reset  ///////////////////////////

  void resetPassWord(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
      Get.defaultDialog(
          title: "Reset Password",
          middleText: "check your gmail messages",
          textCancel: "Ok",
          buttonColor: mainColor,
          cancelTextColor: mainColor2,
          backgroundColor: white);
    } on FirebaseAuthException catch (error) {
      String title = error.code.toString().replaceAll(RegExp('-'), ' ');
      String message = "";
      if (error.code == 'user-not-found') {
        message =
        "Account does not exists for that $email.. Create your account by signing up..";
      } else {
        message = error.message.toString();
      }
      Get.defaultDialog(
          title: title,
          middleText: message,
          textCancel: "Ok",
          buttonColor: mainColor,
          cancelTextColor: mainColor2,
          backgroundColor: white);
    } catch (error) {
      Get.defaultDialog(
          title: "Error",
          middleText: "$error",
          textCancel: "Ok",
          buttonColor: mainColor,
          cancelTextColor: mainColor2,
          backgroundColor: white);
      print(error);
    }
  }
}
