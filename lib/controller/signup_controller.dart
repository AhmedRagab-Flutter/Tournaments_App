import 'package:dm_mw_project/model/model.dart';
import 'package:dm_mw_project/model/mongodb.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  goToLogin();
  googleSignUp();
  facebookSignUp();
  xSignUp();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  // final _auth = FirebaseAuth.instance;

  @override
  goToLogin() async {
    MongoDatabase.addUser(
        UsersModel(account: email.text, password: password.text));
    //   try {
    //     await _auth.createUserWithEmailAndPassword(
    //       email: email.text,
    //       password: password.text,
    //     );
    //     await Get.defaultDialog(
    //       title: "Done",
    //       content: const Text("Email Created Successfully"),
    //     );
    //     Get.offNamed("/login");
    //   } on FirebaseAuthException catch (e) {
    //     if (e.code == 'email-already-in-use') {
    //       Get.defaultDialog(
    //         title: "Error",
    //         content: const Text("Email Is Already Used"),
    //       );
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
  }

  @override
  facebookSignUp() {
    Get.defaultDialog(
      content: const Text("Coming Soon"),
    );
  }

  @override
  googleSignUp() {
    Get.defaultDialog(
      content: const Text("Coming Soon"),
    );
  }

  @override
  xSignUp() {
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
