import 'package:flutter/material.dart';
import 'package:new_project/utils/assets.dart';
import 'package:new_project/utils/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // getUsersLoggedInStatusAndNavigate();
  }

  getUsersLoggedInStatusAndNavigate() async {
    final isLoggedIn = await SharedPref.getUserHasLoggedIn();
    if (isLoggedIn) {
      await Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamed(context, "/mainScreen");
      });
    } else {
      await Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/loginScreen");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.googleIcon,
          height: 300,
          width: 300,
          // fit: BoxFit.fitHeight //for panaromic images ,
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
