import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshops_app/app/modules/home/binding.dart';
import 'package:workshops_app/app/modules/home/page.dart';
import 'package:workshops_app/app/modules/login/binding.dart';
import 'package:workshops_app/app/modules/login/page.dart';
import 'package:workshops_app/app/modules/workshop/binding.dart';
import 'package:workshops_app/app/modules/workshop/page.dart';

import 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.workshop,
      page: () => WorkshopPage(),
      binding: WorkshopBinding(),
    ),
  ];
}

class RedirectMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }
}
