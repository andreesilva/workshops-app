import 'package:workshops_app/app/core/theme/errors.dart';
import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/modules/home/repository.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:workshops_app/app/widgets/message_general_error.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class HomeController extends GetxController
    with StateMixin<List<WorkshopModel>> {
  HomeRepository _repository;

  HomeController(this._repository);

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  var descriptionController = TextEditingController();

  var searchWorkshopName = TextEditingController();

  var searchWorkshopData = TextEditingController();

  var flagSearchButton = 0.obs;

  int litrageValue = 0;

  final litrageId = RxnInt();
  final cityId = RxnInt();

  var nameController = TextEditingController();

  @override
  void onInit() {
    if (flagSearchButton.value == 0) {
      listWorkshops('');
    } else {
      listWorkshops(null);
    }

    super.onInit();
  }

  void listWorkshops(String? search) {
    print(search);
    //_repository.getMyDonationsPet(searchWorkshopName.text).then((data) {
    _repository.getHome(search).then((data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    }, onError: (error) {
      errors(error);
    });
  }

  submitSearch() {
    if (flagSearchButton.value == 1) {
      listWorkshops(searchWorkshopName.text);

      searchWorkshopName.clear();
    }
    if (flagSearchButton.value == 2) {
      listWorkshops(searchWorkshopData.text);

      searchWorkshopData.clear();
    }
  }

  void changeLiterage(int? literageIdSelected) {
    litrageId.value = literageIdSelected;
  }

  void showAlertSuccess(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Anúncio inativado com sucesso!",
        confirmBtnText: "Ok",
        type: quickAlertType,
        onConfirmBtnTap: () => Get.offAllNamed(Routes.home));
  }

  void showAlertError(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Não foi possível inativar o anúncio",
        confirmBtnText: "Ok",
        type: quickAlertType);
  }

  void showAlertActivateSuccess(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Anúncio ativado com sucesso!",
        confirmBtnText: "Ok",
        type: quickAlertType,
        onConfirmBtnTap: () => Get.offAllNamed(Routes.home));
  }

  void showAlertActivateError(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Não foi possível ativar o anúncio",
        confirmBtnText: "Ok",
        type: quickAlertType);
  }

  void showAlertDeleteSuccess(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Anúncio excluído com sucesso!",
        confirmBtnText: "Ok",
        type: quickAlertType,
        onConfirmBtnTap: () => Get.offAllNamed(Routes.home));
  }

  void showAlertDeleteError(QuickAlertType quickAlertType) {
    QuickAlert.show(
        barrierDismissible: false,
        context: Get.context!,
        title: "",
        text: "Não foi possível excluír o anúncio",
        confirmBtnText: "Ok",
        type: quickAlertType);
  }
}
