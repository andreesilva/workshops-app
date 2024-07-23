import 'package:workshops_app/app/data/providers/api.dart';
import 'package:workshops_app/app/modules/home/controller.dart';
import 'package:workshops_app/app/modules/home/repository.dart';

import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    print("Binding");
    Get.lazyPut<HomeController>(
        () => HomeController(HomeRepository(Get.find<Api>())));
  }
}
