import 'package:dm_mw_project/model/mongodb.dart';
import 'package:dm_mw_project/view/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Games> gamesList = [
  Games(name: "WildRift", image: "assets/images/wr1.png", gameName: "wildrift"),
  Games(name: "EA FC", image: "assets/images/ea.png", gameName: "EA FC"),
  Games(name: "PUBG", image: "assets/images/pubg.png", gameName: "pubg"),
  Games(
      name: "Battel..",
      image: "assets/images/pp.png",
      gameName: "battle prime"),
];

class Games {
  String? name;
  String? image;
  String? gameName;
  Games({this.name, this.image, this.gameName});
}

class GamesList extends StatelessWidget {
  final int index;
  const GamesList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => GameScreen(
              gameName: gamesList[index].gameName!,
              name: gamesList[index].name!,
              list: gamesList[index].gameName == "wildrift"
                  ? wrChallenges
                  : gamesList[index].gameName == "pubg"
                      ? puChallenges
                      : gamesList[index].gameName == "battle prime"
                          ? bpChallenges
                          : eaChallenges,
            ));
      },
      child: Container(
        margin:
            EdgeInsets.only(right: Get.width * 0.02, top: Get.height * 0.025),
        height: Get.height * 0.12,
        width: Get.width * 0.2,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.07,
              width: Get.width * 0.14,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(gamesList[index].image!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(height: 10),
            Text(gamesList[index].name!),
          ],
        ),
      ),
    );
  }
}
