import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SignButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: Get.width,
      height: Get.height * 0.07,
      color: AppColors.appBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 17,
              color: AppColors.appWhite,
            ),
      ),
    );
  }
}
