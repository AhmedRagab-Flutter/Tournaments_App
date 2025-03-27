import 'package:dm_mw_project/controller/home_controller.dart';
import 'package:dm_mw_project/core/constants/appcolors.dart';
import 'package:dm_mw_project/model/mongodb.dart';
import 'package:dm_mw_project/view/screens/add_tournament.dart';
import 'package:dm_mw_project/view/widgets/games_list.dart';
import 'package:dm_mw_project/view/widgets/searchbar.dart';
import 'package:dm_mw_project/view/widgets/tournament_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      floatingActionButton: MaterialButton(
        onPressed: () {
          Get.to(() => const AddTournamentScreen());
        },
        color: AppColors.appGreen,
        height: 60,
        minWidth: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.add,
          color: AppColors.appBlack,
          size: 30,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sort, color: AppColors.appBlue2),
        ),
        backgroundColor: AppColors.appwhite2,
        elevation: 0,
        centerTitle: true,
        title: const Text("Home"),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      backgroundColor: AppColors.appwhite2,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.height * 0.02),
        child: ListView(
          children: [
            const AppSearchBar(hintText: "Search"),
            Row(
              children: [
                Text(
                  "Top Challenges",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "See all",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: AppColors.appBlue2,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ...List.generate(
                  gamesList.length,
                  (index) => GamesList(index: index),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.04),
            Row(
              children: [
                Text(
                  "Tournaments",
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
            SizedBox(height: Get.height * 0.03),
            ...List.generate(
              tournamentsList.length,
              (index) => TournamentCard(
                image: tournamentsList[index].game! == "pubg"
                    ? "assets/images/PUBGT.png"
                    : tournamentsList[index].game! == "wildrift"
                        ? "assets/images/wrT.png"
                        : tournamentsList[index].game! == "EA FC"
                            ? "assets/images/eaT.png"
                            : "assets/images/ppT.png",
                prize: tournamentsList[index].prize!,
                title: tournamentsList[index].name!,
                date: tournamentsList[index].date!,
                place: tournamentsList[index].place!,
                game: tournamentsList[index].game!,
                time: tournamentsList[index].time!,
                description: tournamentsList[index].description!,
              ),
            ),

            // const TournamentCard(
            //     image: "assets/images/PUBGT.png",
            //     prize: "prize",
            //     title: "title",
            //     date: "date")
          ],
        ),
      ),
    );
  }
}
