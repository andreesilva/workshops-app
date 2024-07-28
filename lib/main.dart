import 'package:workshops_app/app/core/theme/app_theme.dart';
import 'package:workshops_app/app/data/providers/api.dart';
import 'package:workshops_app/app/data/services/auth/repository.dart';
import 'package:workshops_app/app/data/services/auth/service.dart';
import 'package:workshops_app/app/data/services/storage/service.dart';

import 'package:workshops_app/app/routes/pages.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  Get.put<StorageService>(StorageService());
  Get.put<Api>(Api());
  Get.put<AuthService>(AuthService(AuthRepository(Get.find<Api>())));

  Intl.defaultLocale = "pt_BR";

  SemanticsBinding.instance.ensureSemantics();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.login,
    theme: themeData,
    getPages: AppPages.pages,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('pt', 'BR'),
    supportedLocales: const [Locale('pt', 'BR')],
  ));
}
