import 'package:dm_mw_project/controller/signup_controller.dart';
import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/view/widgets/sign_button_auth.dart';
import 'package:dm_mw_project/view/widgets/signwith_button_auth.dart';
import 'package:dm_mw_project/view/widgets/textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColors.secondPrimeColor,
      body: Form(
        key: controller.formState,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                    alignment: Alignment.center,
                    height: Get.height * 0.1,
                    width: Get.width * 0.5,
                    child: Image.asset(
                      "assets/images/logo2.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Create your Account",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Spacer(),
                GetBuilder<SignUpControllerImp>(
                  builder: (controller) => TextFormAuth(
                    mycontroller: controller.email,
                    hintText: "Email",
                  ),
                ),
                GetBuilder<SignUpControllerImp>(
                  builder: (controller) => TextFormAuth(
                    obscureText: true,
                    mycontroller: controller.password,
                    hintText: "Password",
                  ),
                ),
                const Spacer(),
                SignButtonAuth(
                  onPressed: () {
                    controller.goToLogin();
                  },
                  text: "Sign Up",
                ),
                const Spacer(),
                Center(
                  child: Text(
                    "- Or sign in with -",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SignWithButtonAuth(
                      onPressed: () {
                        controller.googleSignUp();
                      },
                      image: "assets/images/g.png",
                    ),
                    SignWithButtonAuth(
                      onPressed: () {
                        controller.facebookSignUp();
                      },
                      image: "assets/images/f.png",
                    ),
                    SignWithButtonAuth(
                      onPressed: () {
                        controller.xSignUp();
                      },
                      image: "assets/images/x.png",
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
