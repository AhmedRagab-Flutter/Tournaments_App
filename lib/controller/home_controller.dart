import 'package:dm_mw_project/model/mongodb.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  @override
  void onInit() async {
    await MongoDatabase.readChallenge();
    super.onInit();
  }
}
