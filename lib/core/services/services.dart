import 'package:dm_mw_project/model/mongodb.dart';
import 'package:get/get.dart';

class AppServices extends GetxService {
  Future<AppServices> init() async {
    await MongoDatabase.connect();
    await MongoDatabase.readAllTournaments();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppServices().init());
}
