import 'package:get_storage/get_storage.dart';
import 'package:workshops_app/app/core/theme/errors.dart';
import 'package:workshops_app/app/core/util/get_storage_key.dart';
import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/data/services/auth/service.dart';
import 'package:workshops_app/app/data/services/storage/service.dart';
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

  final _storageService = Get.find<StorageService>();
  final _authService = Get.find<AuthService>();

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();

  var descriptionController = TextEditingController();

  var searchWorkshopName = TextEditingController();

  var searchWorkshopData = TextEditingController();

  var searchWorkshopCollaborator = TextEditingController();

  var flagSearchButton = 0.obs;

  var nameCollaborator = '';

  bool get isLogged => _authService.isLogged;

  @override
  void onInit() {
    if (flagSearchButton.value == 0) {
      listWorkshops('');
    } else {
      listWorkshops(null);
    }

    super.onInit();
  }

  Future<void> listWorkshops(
    String? search,
  ) async {
    if (flagSearchButton.value == 1) {
      _repository.getWorkshopName(search).then((data) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      }, onError: (error) {
        errors(error);
      });
    } else if (flagSearchButton.value == 2) {
      _repository.getWorkshopDate(search).then((data) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      }, onError: (error) {
        errors(error);
      });
    } else if (flagSearchButton.value == 3) {
      _repository.getWorkshopCollaborator(search).then((data) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      }, onError: (error) {
        errors(error);
      });
    } else {
      _repository.getWorkshopName(search).then((data) {
        if (data.isEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      }, onError: (error) {
        errors(error);
      });
    }
  }

  submitSearchCollaborator() {
    listWorkshops(searchWorkshopCollaborator.text);

    nameCollaborator = searchWorkshopCollaborator.text;

    searchWorkshopCollaborator.clear();
  }

  submitSearchName() {
    listWorkshops(searchWorkshopName.text);

    searchWorkshopName.clear();
  }

  submitSearchDate() {
    listWorkshops(searchWorkshopData.text.replaceAll('/', '-'));

    searchWorkshopData.clear();
  }

  void logout() async {
    _storageService.removeToken();

    Get.offAllNamed(Routes.login);
  }
}
