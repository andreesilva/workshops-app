import 'package:workshops_app/app/data/providers/api.dart';
import 'package:workshops_app/app/data/services/auth/repository.dart';
import 'package:workshops_app/app/modules/login/controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(AuthRepository(Get.find<Api>())));
  }
}
