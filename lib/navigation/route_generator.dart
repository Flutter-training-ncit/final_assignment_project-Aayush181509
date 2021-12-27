import 'package:flutter/material.dart';
import 'package:new_project/ui/screen/loading_page.dart';
import 'package:new_project/ui/screen/login_page.dart';
import 'package:new_project/ui/screen/splash_screen.dart';

Route ourRouteGenerator(RouteSettings setting) {
  switch (setting.name) {
    case "/mainScreen":
      return MaterialPageRoute(
        builder: (context) => LoadingPage(),
      );
    case "/loginScreen":
      return MaterialPageRoute(
        builder: (context) => LoginPageScreen(),
      );
    case "/splashScreen":
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => LoadingPage(),
      );
  }
}
