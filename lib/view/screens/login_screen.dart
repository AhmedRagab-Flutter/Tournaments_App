import 'package:dm_mw_project/controller/login_controller.dart';
import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/view/widgets/sign_button_auth.dart';
import 'package:dm_mw_project/view/widgets/signwith_button_auth.dart';
import 'package:dm_mw_project/view/widgets/textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColors.secondPrimeColor,
      body: SafeArea(
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
                "Login to your Account",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const Spacer(),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => TextFormAuth(
                  mycontroller: controller.email,
                  hintText: "Email",
                ),
              ),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => TextFormAuth(
                  obscureText: true,
                  mycontroller: controller.password,
                  hintText: "Password",
                ),
              ),
              const Spacer(),
              SignButtonAuth(
                onPressed: () {
                  controller.goToHomePage();
                },
                text: "Sign in",
              ),
              const Spacer(),
              Center(
                child: Text(
                  "- Or sign in with -",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SignWithButtonAuth(
                    onPressed: () {
                      controller.googleLogin();
                    },
                    image: "assets/images/g.png",
                  ),
                  SignWithButtonAuth(
                    onPressed: () {
                      controller.facebookLogin();
                    },
                    image: "assets/images/f.png",
                  ),
                  SignWithButtonAuth(
                    onPressed: () {
                      controller.xLogin();
                    },
                    image: "assets/images/x.png",
                  ),
                ],
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account ? ",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToSignUp();
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: AppColors.appBlue,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
