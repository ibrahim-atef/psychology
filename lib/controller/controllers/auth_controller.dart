import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:psychology/routes/routes.dart';
import 'package:psychology/utils/constants.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GetStorage authBox = GetStorage();
  var googleSignin = GoogleSignIn();
  var displayUserName = ''.obs;
  var displayUserPhoto = "".obs;
  var displayUserEmail = "".obs;

  var isSignedIn = false;

//////////////////////////////////الsign up//////////////////////////////////////////////////////////////////////////
  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.offNamed(Routes.mainScreen);
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
      Get.offNamed(Routes.mainScreen);
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

      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
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
}
