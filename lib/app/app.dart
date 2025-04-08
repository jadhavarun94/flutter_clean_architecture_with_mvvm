

import 'package:flutter/material.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/theme_manager.dart';
import 'package:course_clean_architecture_with_mvvm/presentation/resources/routes_manager.dart';
class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor
  int appState = 0;
  static final MyApp instance = MyApp._internal(); // Single instance --- singleton class

  factory MyApp()=> instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),);
  }
}
