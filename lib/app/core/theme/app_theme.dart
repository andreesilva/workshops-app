import 'package:flutter/material.dart';

var colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
);

var elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary));

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorScheme: colorScheme,
  useMaterial3: true,
  elevatedButtonTheme: elevatedButtonTheme,
  dialogBackgroundColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 7,
    shadowColor: Colors.blueGrey,
  ),
);
