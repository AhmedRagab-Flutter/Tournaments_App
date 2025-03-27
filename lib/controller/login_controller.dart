import 'package:dm_mw_project/model/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  goToHomePage();
  goToSignUp();
  googleLogin();
  facebookLogin();
  xLogin();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  // final _auth = FirebaseAuth.instance;

  @override
  goToHomePage() async {
    MongoDatabase.checkUsers(email.text, password.text);
    // try {
    //   final UserCredential userCredential =
    //       await _auth.signInWithEmailAndPassword(
    //     email: email.text,
    //     password: password.text,
    //   );
    //   final User? user = userCredential.user;
    //   if (user != null) {
    //     Get.back();
    //     Get.offNamed("/home");
    //   }
    // } catch (e) {
    //   Get.back();
    //   Get.defaultDialog(
    //     title: "Error",
    //     content: const Text("Wrong Email or Password"),
    //   );
    // }
  }

  @override
  goToSignUp() {
    Get.toNamed("/signup");
  }

  @override
  googleLogin() {
    Get.defaultDialog(
      content: const Text("Coming Soon"),
    );
  }

  @override
  xLogin() {
    Get.defaultDialog(
      content: const Text("Coming Soon"),
    );
  }

  @override
  facebookLogin() {
    Get.defaultDialog(
      content: const Text("Coming Soon"),
    );
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
