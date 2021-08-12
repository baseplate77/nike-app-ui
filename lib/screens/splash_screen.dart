import 'package:flutter/material.dart';
import 'package:nike/navigation.dart';

import '../constant.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    next();
    super.initState();
  }

  void next() async {
    await Future.delayed(Duration(milliseconds: 750));
    navigate(context, HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Hero(
          tag: 'nike',
          child: Image.asset(
            'assets/images/nike_white_2.png',
            color: Colors.white,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
