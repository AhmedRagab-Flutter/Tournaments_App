import 'package:dm_mw_project/model/model.dart';
import 'package:dm_mw_project/model/mongodb.dart';
import 'package:dm_mw_project/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddTournamentController extends GetxController {
  addTournament();
}

class AddTournamentControllerImp extends AddTournamentController {
  late TextEditingController name;
  late TextEditingController time;
  late TextEditingController date;
  late TextEditingController game;
  late TextEditingController description;
  late TextEditingController place;
  late TextEditingController prize;

  @override
  addTournament() async {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
    await MongoDatabase.insertTournament(Tournaments(
      name: name.text,
      time: time.text,
      date: date.text,
      game: game.text,
      description: description.text,
      place: place.text,
      prize: prize.text,
    ));
    Get.back();
    Get.off(() => const HomeScreen());
  }

  @override
  void onInit() {
    name = TextEditingController();
    time = TextEditingController();
    date = TextEditingController();
    game = TextEditingController();
    description = TextEditingController();
    place = TextEditingController();
    prize = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    time.dispose();
    date.dispose();
    game.dispose();
    description.dispose();
    place.dispose();
    prize.dispose();
    super.dispose();
  }
}
