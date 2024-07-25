import 'dart:convert';
import 'dart:io';

import 'package:workshops_app/app/data/models/workshop.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class Api extends GetConnect {
  //final _storageService = Get.find<StorageService>();

  final _client = http.Client();
  //dynamic _url = 'https://google.com';
  //dynamic _url = 'http://10.0.0.230:3333';
  //bool isInternet = false;

  @override
  void onInit() {
    //LOCAL
    //httpClient.baseUrl = "http://10.0.0.230:3333/";
    //_url = httpClient.baseUrl = "http://10.0.0.230:3333";
    //httpClient.baseUrl = "http://192.168.192.19:3333/";

    //Produção
    //httpClient.baseUrl = "https://receitaws.com.br/v1/cnpj/";
/*
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });

    httpClient.addAuthenticator((Request request) {
      var token = _storageService.token;
      var headers = {'Authorization': 'Bearer $token'};

      request.headers.addAll(headers);

      return request;
    });*/
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      request.headers['Content-Type'] = 'application/json';

      return request;
    });
    print("api.dart");

    super.onInit();
  }

  Future<List<WorkshopModel>> getHome(searchaWorkshop) async {
    // var namePassado = "";
    // if (searchaWorkshop) {
    //   namePassado = searchaWorkshop;
    //   // print(namePassado);
    // }

    print(searchaWorkshop);

    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              'http://10.0.0.230:3000/api/attendance-sheets?workshopNome=$searchaWorkshop'),
          headers: {'Content-Type': 'application/json'});

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }
      print(response.statusCode);
      print(response.body);
      return data;
    } catch (e) {
      print("hkhjhhkhjkhjkh");
      throw e.toString();
    }
  }

  Future<List<WorkshopModel>> getWorkshop(id) async {
    try {
      List<WorkshopModel> data = [];

      var response = await _client.get(
          Uri.parse(
              'http://10.0.0.230:3000/api/attendance-sheets/collaborator/$id'),
          headers: {'Content-Type': 'application/json'});

      for (var donation in jsonDecode(response.body)) {
        data.add(WorkshopModel.fromJson(donation));
      }
      print(response.statusCode);
      print(response.body);
      return data;
    } catch (e) {
      print("hkhjhhkhjkhjkh");
      throw e.toString();
    }
  }
}
