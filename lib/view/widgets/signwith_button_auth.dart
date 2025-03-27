import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignWithButtonAuth extends StatelessWidget {
  final void Function() onPressed;
  final String image;
  const SignWithButtonAuth(
      {super.key, required this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColors.appWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: Get.height * 0.07,
        width: Get.width * 0.07,
        child: Image.asset(
          image,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
