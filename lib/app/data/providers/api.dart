import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:workshops_app/app/core/util/get_storage_key.dart';
import 'package:workshops_app/app/data/models/user.dart';
import 'package:workshops_app/app/data/models/user_login_request.dart';
import 'package:workshops_app/app/data/models/user_login_response.dart';
import 'package:workshops_app/app/data/models/workshop.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:workshops_app/app/data/services/storage/service.dart';

import 'package:dio/dio.dart';
import 'package:workshops_app/app/routes/routes.dart';

class Api extends GetConnect {
  final _storageService = Get.find<StorageService>();
  final _client = http.Client();

  dynamic _url = "http://10.0.0.230:3000";

  @override
  void onInit() {
    super.onInit();
  }

  Future<UserLoginResponseModel> login(UserLoginRequestModel data) async {
    try {
      var response = await _client.post(
        Uri.parse('$_url/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      return UserLoginResponseModel.fromJson(json.decode(response.body));
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserModel> getUser() async {
    try {
      final response = await http.get(
        Uri.parse('$_url/auth/me'),
        headers: {
          'Content-Type': 'application/json',
          'authorization': 'Bearer ${_storageService.accessToken}',
        },
      );

      return UserModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<WorkshopModel>> getWorkshopCollaborator(searchaWorkshop) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              '$_url/api/attendance-sheets/workshop/collaborator?collaborator=$searchaWorkshop'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer ${_storageService.accessToken}'
          });

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<WorkshopModel>> getWorkshopName(searchaWorkshop) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              '$_url/api/attendance-sheets/workshop/name?name=$searchaWorkshop'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer ${_storageService.accessToken}'
          });

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<WorkshopModel>> getWorkshopDate(searchaWorkshop) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              '$_url/api/attendance-sheets/workshop/date?date=$searchaWorkshop'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer ${_storageService.accessToken}'
          });

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<WorkshopModel>> getWorkshop(id) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse('$_url/api/attendance-sheets/collaborator/$id'),
          headers: {
            'Content-Type': 'application/json',
            'authorization': 'Bearer ${_storageService.accessToken}'
          });

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }

      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
