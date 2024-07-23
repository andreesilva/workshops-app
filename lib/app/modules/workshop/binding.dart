import 'package:get/get.dart';
import 'package:workshops_app/app/data/providers/api.dart';
import 'package:workshops_app/app/modules/workshop/controller.dart';
import 'package:workshops_app/app/modules/workshop/repository.dart';

class WorkshopBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkshopController>(
        () => WorkshopController(WorkshopRepository(Get.find<Api>())));
  }
}
