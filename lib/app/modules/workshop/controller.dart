import 'package:workshops_app/app/core/theme/errors.dart';
import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/data/services/auth/service.dart';
import 'package:workshops_app/app/data/services/storage/service.dart';
import 'package:workshops_app/app/modules/workshop/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopController extends GetxController
    with StateMixin<List<WorkshopModel>> {
  final WorkshopRepository _repository;

  WorkshopController(this._repository);

  final _storageService = Get.find<StorageService>();

  final _authService = Get.find<AuthService>();

  bool get isLogged => _authService.isLogged;

  bool get isTokenExpired =>
      _storageService.isTokenExpired(_storageService.accessToken.toString());

  final loadingCircular = ValueNotifier<bool>(false);

  final loading = true.obs;

  @override
  void onInit() {
    final id = int.parse(Get.parameters["id"]!);

    _repository.getWorkshop(id).then((data) {
      if (data.isEmpty) {
        change([], status: RxStatus.empty());
      } else {
        change(data, status: RxStatus.success());
      }
    }, onError: (error) {
      errors(error);
    });

    super.onInit();
  }
}
