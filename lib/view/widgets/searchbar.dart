import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSearchBar extends StatelessWidget {
  final String hintText;
  const AppSearchBar({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      alignment: Alignment.center,
      height: Get.height * 0.05,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 180, 184, 188),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: const Icon(Icons.search),
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
