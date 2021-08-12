import 'package:flutter/material.dart';

import '../../constant.dart';
import 'widget/app_bar.dart';
import 'widget/bottom_bar.dart';
import 'widget/home_page_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  ThemeProvider? themeProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
              child: CustomAppBar(),
            ),
            SizedBox(height: 32),
            Expanded(child: HomePageBody())
          ],
        ),
      ),
    );
  }
}
