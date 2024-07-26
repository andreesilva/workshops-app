import 'dart:convert';

import 'package:workshops_app/app/data/models/workshop.dart';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  final _client = http.Client();

  dynamic _url = "http://10.0.0.230:3000";

  @override
  void onInit() {
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    super.onInit();
  }

  Future<List<WorkshopModel>> getHome(searchaWorkshop) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              '$_url/api/attendance-sheets?workshopNome=$searchaWorkshop'),
          headers: {'Content-Type': 'application/json'});

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }
      print(data);
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
          headers: {'Content-Type': 'application/json'});

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }

      print(response.body);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
