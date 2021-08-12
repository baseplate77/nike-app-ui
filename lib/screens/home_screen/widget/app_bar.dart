import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 28;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(
          tag: 'nike',
          child: SizedBox(
            width: 45,
            height: 45,
            child: Image.asset(
              'assets/images/nike.png',
              width: size,
              height: size,
              color: Colors.white,
            ),
          ),
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/images/menu.svg',
          width: size,
          height: size,
          color: Colors.white,
        ),
        // Icon(Icons.menu, color: Colors.white),
        SizedBox(
          width: 20,
        ),
        SvgPicture.asset("assets/images/bag.svg",
            width: size, height: size, color: Colors.white),
        // Icon(Icons.home, color: Colors.white),
      ],
    );
  }
}
