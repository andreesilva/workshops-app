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
  final formKey3 = GlobalKey<FormState>();

  var descriptionController = TextEditingController();

  var searchWorkshopName = TextEditingController();

  var searchWorkshopData = TextEditingController();

  var flagSearchButton = 0.obs;

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
}
