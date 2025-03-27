import 'package:dm_mw_project/controller/add_tournament_controller.dart';
import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/view/widgets/sign_button_auth.dart';
import 'package:dm_mw_project/view/widgets/textform_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTournamentScreen extends StatelessWidget {
  const AddTournamentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddTournamentControllerImp controller =
        Get.put(AddTournamentControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort, color: AppColors.appBlue2),
        ),
        backgroundColor: AppColors.appwhite2,
        elevation: 0,
        centerTitle: true,
        title: const Text("Add Tournament"),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: AppColors.appwhite2,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Name",
                    mycontroller: controller.name,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Game",
                    mycontroller: controller.game,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Description",
                    mycontroller: controller.description,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Date",
                    mycontroller: controller.date,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Time",
                    mycontroller: controller.time,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Place",
                    mycontroller: controller.place,
                  )),
            ),
            GetBuilder<AddTournamentControllerImp>(
              builder: ((controller) => TextFormAuth(
                    hintText: "Prize",
                    mycontroller: controller.prize,
                  )),
            ),
            SignButtonAuth(
              onPressed: () {
                controller.addTournament();
              },
              text: "Add",
            ),
          ],
        ),
      ),
    );
  }
}
