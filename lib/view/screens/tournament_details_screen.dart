import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/model/mongodb.dart';
import 'package:dm_mw_project/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentDetailsScreen extends StatelessWidget {
  final String name;
  final String game;
  final String date;
  final String place;
  final String image;
  final String description;
  final String time;
  const TournamentDetailsScreen(
      {super.key,
      required this.name,
      required this.game,
      required this.date,
      required this.place,
      required this.image,
      required this.description,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appwhite2,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: AppColors.appWhite,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Get.height * 0.2,
              right: Get.width * 0.06,
              left: Get.width * 0.06,
            ),
            width: Get.width,
            height: Get.height * 0.36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.appWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.appDarkGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(height: Get.width * 0.03),
                  Center(
                    child: Text(
                      game,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      SizedBox(width: Get.width * 0.04),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      const Icon(Icons.place),
                      SizedBox(width: Get.width * 0.04),
                      Text(
                        place,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    children: [
                      const Icon(Icons.android),
                      SizedBox(width: Get.width * 0.04),
                      Container(
                        width: Get.width * 0.05,
                        height: Get.height * 0.02,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.appBlack,
                        ),
                        child: const Icon(
                          Icons.phone_android,
                          color: AppColors.appWhite,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.2,
                        child: const Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.appGreen,
                              backgroundImage:
                                  AssetImage("assets/images/f.png"),
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
                      const Spacer(),
                      MaterialButton(
                        onPressed: () async {
                          Get.dialog(
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                            barrierDismissible: false,
                          );
                          await MongoDatabase.deleteTournament(name);
                          await MongoDatabase.readAllTournaments();
                          Get.off(() => const HomeScreen());
                          Get.back();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.red,
                        child: const Text("Delete"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: Get.height * 0.59,
              right: Get.width * 0.06,
              left: Get.width * 0.06,
            ),
            width: Get.width,
            height: Get.height * 0.36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.appWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Tournament Description",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.appDarkGrey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.watch_later),
                      SizedBox(width: Get.width * 0.02),
                      Text(
                        "Time",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 15),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
