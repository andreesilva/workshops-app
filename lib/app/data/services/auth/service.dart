import 'dart:io';

import 'package:workshops_app/app/data/models/user.dart';
import 'package:workshops_app/app/data/models/user_login_request.dart';
import 'package:workshops_app/app/data/services/auth/repository.dart';
import 'package:workshops_app/app/data/services/storage/service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService extends GetxService {
  final _storageService = Get.find<StorageService>();
  AuthRepository _repository;
  final user = Rxn<UserModel>();
  bool get isLogged => user.value != null;
  AuthService(this._repository);

  @override
  void onInit() async {
    if (_storageService.accessToken != null) {
      await _getUser();
    }

    super.onInit();
  }

  Future<void> login(UserLoginRequestModel userLoginRequestModel) async {
    var userLoginResponse = await _repository.login(userLoginRequestModel);
    await _storageService.saveToken(userLoginResponse.token);
    await _getUser();
  }

  Future<void> logout() async {
    await _storageService.removeToken();
    user.value = null;
  }

  Future _getUser() {
    return _repository.getUser().then((value) {
      user.value = value;
    });
  }
}
