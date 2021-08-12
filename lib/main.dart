import 'package:flutter/material.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:nike/screens/home_screen/home_screen.dart';
import 'package:nike/screens/shoe_screen/shoe_screen.dart';
import 'package:nike/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nike',
      theme: ThemeData(fontFamily: 'Futura'),
      home: SplashScreen(),
      // home: ShoeScreen(),
    );
  }
}
