import 'package:get/get.dart';
import 'package:hadith_app_test/controllers/database_controller.dart';
import 'package:hadith_app_test/database/app_database.dart';

class InitDependency extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DatabaseController() );
  }

}