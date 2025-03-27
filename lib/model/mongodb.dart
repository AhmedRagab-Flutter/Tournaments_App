import 'package:dm_mw_project/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

List<Tournaments> tournamentsList = [];
List<Challenges> wrChallenges = [];
List<Challenges> puChallenges = [];
List<Challenges> bpChallenges = [];
List<Challenges> eaChallenges = [];

class MongoDatabase {
  static var db1, db2, db3;
  static var collectionTour,
      collectionChalWR,
      collectionChalPU,
      collectionChalBP,
      collectionChalEA,
      collectionUsers;

  static connect() async {
    const String mongoDbUrl1 =
        "mongodb+srv://flutter:flutter1@cluster0.7dleref.mongodb.net/tournaments_db?retryWrites=true&w=majority&appName=Cluster0";
    const String mongoDbUrl2 =
        "mongodb+srv://flutter:flutter1@cluster0.7dleref.mongodb.net/challenges_db?retryWrites=true&w=majority&appName=Cluster0";
    const String mongoDbUrl3 =
        "mongodb+srv://flutter:flutter1@cluster0.7dleref.mongodb.net/users_db?retryWrites=true&w=majority&appName=Cluster0";
    db1 = await Db.create(mongoDbUrl1);
    db2 = await Db.create(mongoDbUrl2);
    db3 = await Db.create(mongoDbUrl3);
    await db1.open();
    await db2.open();
    await db3.open();

    collectionTour = db1.collection("tournaments");
    collectionChalBP = db2.collection("battel prime");
    collectionChalWR = db2.collection("wildrift");
    collectionChalPU = db2.collection("pubg");
    collectionChalEA = db2.collection("EA FC");
    collectionUsers = db3.collection("users");
  }

  static Future<void> addUser(UsersModel user) async {
    Get.dialog(
      Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator()),
      barrierDismissible: false,
    );
    await connect();
    final acc =
        await collectionUsers.findOne(where.eq("account", user.account));
    if (acc == null) {
      Get.back();
      await collectionUsers.insertOne(user.toJson());
      await Get.defaultDialog(
        title: "Done",
        content: const Text("Email Created Successfully"),
      );
      Get.offNamed("/login");
    } else {
      Get.back();
      return Get.defaultDialog(
        title: "Erroe",
        content: const Text("The Email Already Exists"),
      );
    }
  }

  static Future<void> checkUsers(String account, String password) async {
    Get.dialog(
      Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator()),
      barrierDismissible: false,
    );
    await connect();
    final acc = await collectionUsers.findOne(where.eq("account", account));
    final pass = await collectionUsers.findOne(where.eq("password", password));
    if (acc == null) {
      Get.back();
      return Get.defaultDialog(
        title: "Erroe",
        content: const Text("Please Re-Enter your Email"),
      );
    } else {
      if (pass == null) {
        Get.back();
        return Get.defaultDialog(
          title: "Erroe",
          content: const Text("Please Re-Enter your Password"),
        );
      } else {
        Get.back();
        Get.offNamed("/home");
      }
    }
  }

  static Future<void> readAllTournaments() async {
    await connect();
    final List<Map<String, dynamic>> data =
        await collectionTour.find().toList();
    tournamentsList = data.map((data) => Tournaments.fromJson(data)).toList();
  }

  static Future<void> readChallenge() async {
    await connect();
    final List<Map<String, dynamic>> data1 =
        await collectionChalBP.find().toList();
    bpChallenges = data1.map((data) => Challenges.fromJson(data)).toList();
    final List<Map<String, dynamic>> data2 =
        await collectionChalEA.find().toList();
    eaChallenges = data2.map((data) => Challenges.fromJson(data)).toList();
    final List<Map<String, dynamic>> data3 =
        await collectionChalPU.find().toList();
    puChallenges = data3.map((data) => Challenges.fromJson(data)).toList();
    final List<Map<String, dynamic>> data4 =
        await collectionChalWR.find().toList();
    wrChallenges = data4.map((data) => Challenges.fromJson(data)).toList();
  }

  static Future<void> insertTournament(Tournaments tournament) async {
    await connect();
    await collectionTour.insertOne(tournament.toJson());
  }

  static Future<void> deleteTournament(var name) async {
    await connect();
    await collectionTour.deleteOne(where.eq("name", name));
  }
}
