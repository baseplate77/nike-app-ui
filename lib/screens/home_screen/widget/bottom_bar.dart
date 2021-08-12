import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  final double kBBborderRadius = 44;

  @override
  Widget build(BuildContext context) {
    double size = 28;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      borderRadius: BorderRadius.circular(kBBborderRadius),
      color: themeProvider.accentColor,
      child: Container(
        // padding: EdgeInsets.all(),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              "assets/images/home.svg",
              width: size,
              height: size,
              color: Colors.black,
            ),
            // Icon(
            //   Icons.home,
            //   size: 32,
            // ),
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.black,
              child: SvgPicture.asset(
                "assets/images/circles.svg",
                width: size,
                height: size,
                color: themeProvider.accentColor,
              ),
            ),
            // Icon(Icons.people, size: 32),
            SvgPicture.asset(
              "assets/images/user.svg",
              width: size,
              height: size,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
