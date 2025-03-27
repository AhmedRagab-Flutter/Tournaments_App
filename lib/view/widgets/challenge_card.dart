import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeCard extends StatelessWidget {
  final String prize;
  final String title;
  final String date;
  final String type;
  final String image;
  const ChallengeCard(
      {super.key,
      required this.prize,
      required this.title,
      required this.date,
      required this.type,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 15, top: 20),
      width: Get.width,
      height: Get.height * 0.36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.appWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: Get.height * 0.02),
                height: Get.height * 0.17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: Get.width * 0.29,
                top: Get.height * 0.145,
                child: Container(
                  width: Get.width * 0.25,
                  height: Get.height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.appwhite2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.tour, color: AppColors.appYellow),
                      const SizedBox(width: 6),
                      Text(
                        prize,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: Get.width * 0.73,
                top: Get.height * 0.14,
                child: Container(
                  width: Get.width * 0.1,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.appBlue2,
                  ),
                  child: const Icon(
                    Icons.phone_android,
                    color: AppColors.appWhite,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.appDarkGrey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      date,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    ),
                    Expanded(child: Container()),
                    Text(
                      type,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.2,
                      child: const Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.appGreen,
                            backgroundImage: AssetImage("assets/images/f.png"),
                          ),
                          Positioned(
                            left: 15,
                            child: CircleAvatar(
                              backgroundColor: AppColors.appYellow,
                              backgroundImage:
                                  AssetImage("assets/images/x.png"),
                            ),
                          ),
                          Positioned(
                            left: 30,
                            child: CircleAvatar(
                              backgroundColor: AppColors.appwhite2,
                              child: Text("+220"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Participants",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
