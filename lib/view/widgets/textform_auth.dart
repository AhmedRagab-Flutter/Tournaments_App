import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormAuth extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final bool? obscureText;
  const TextFormAuth(
      {super.key,
      required this.hintText,
      required this.mycontroller,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      height: Get.height * 0.07,
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          helperStyle: const TextStyle(color: AppColors.appGrey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
