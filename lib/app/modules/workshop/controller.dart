import 'package:workshops_app/app/core/theme/errors.dart';
import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/modules/workshop/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopController extends GetxController
    with StateMixin<List<WorkshopModel>> {
  final WorkshopRepository _repository;

  WorkshopController(this._repository);

  final loadingCircular = ValueNotifier<bool>(false);

  final loading = true.obs;

  var currentPageIndex = 0.obs;

  var colorButton1 = false.obs;
  var colorButton2 = false.obs;
  var colorButton3 = false.obs;
  var colorButton4 = false.obs;

  var startCard = false.obs;

  @override
  void onInit() {
    //loading(true);

    final id = int.parse(Get.parameters["id"]!);

    //int cnpj = int.parse(Get.parameters['id']!);

    _repository.getWorkshop(id).then((data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    }, onError: (error) {
      errors(error);
    });

    // _repository.getWorkshop(id).then((data) {
    //   change(data, status: RxStatus.success());
    // }, onError: (error) {
    //   print(error.toString());
    //   if ((error.toString() == "Couldn't resolve host name") ||
    //       (error.toString() == 'Timeout was reached') ||
    //       (error.toString() == 'Network is unreachable') ||
    //       (error.toString() == "Failed host lookup: 'receitaws.com.br'")) {
    //     Get.offAllNamed('/button_error_conection');
    //   } else {
    //     Get.offAllNamed('/button_return');
    //   }
    //   //loadingCircular.value = false;
    // });

    super.onInit();
  }
}
