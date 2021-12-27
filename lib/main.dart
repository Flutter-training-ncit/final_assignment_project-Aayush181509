import 'package:flutter/material.dart';
import 'package:new_project/navigation/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: ourRouteGenerator,
      initialRoute: "/splashScreen",
    );
  }
}
