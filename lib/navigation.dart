import 'package:flutter/material.dart';

void navigate(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  // Navigator.of(context).push(
  //   PageRouteBuilder(
  //       transitionDuration: const Duration(milliseconds: 1750),
  //       pageBuilder: (context, animation, secondAnimation) => screen),
  // );
}
