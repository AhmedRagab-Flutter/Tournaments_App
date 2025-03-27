import 'package:dm_mw_project/controller/game_controller.dart';
import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/model/model.dart';
import 'package:dm_mw_project/view/widgets/challenge_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameControllerImp> {
  final String gameName;
  final String name;
  final List<Challenges> list;
  const GameScreen(
      {super.key,
      required this.gameName,
      required this.name,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort, color: AppColors.appBlue2),
        ),
        backgroundColor: AppColors.appwhite2,
        elevation: 0,
        centerTitle: true,
        title: Text(name),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: AppColors.appwhite2,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.02),
        child: ListView(
          children: [
            Row(
              children: [
                Text(
                  "Challenges",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "Popular",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_drop_down_circle_sharp,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ...List.generate(
              list.length,
              (index) => ChallengeCard(
                type: list[index].type!,
                image: list[index].game! == "pubg"
                    ? "assets/images/pubgC.png"
                    : list[index].game! == "wildrift"
                        ? "assets/images/wrC.png"
                        : list[index].game! == "EA FC"
                            ? "assets/images/eaC.png"
                            : "assets/images/bpC.png",
                prize: list[index].prize!,
                title: list[index].name!,
                date: list[index].date!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
