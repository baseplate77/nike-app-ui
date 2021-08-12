import 'package:flutter/material.dart';
import 'package:nike/constant.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class BigButton extends StatelessWidget {
  const BigButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Provider.of<ThemeProvider>(context).accentColor,
      ),
      child: Center(
        child: Text(
          'BUY',
          style: kText24,
        ),
      ),
    );
  }
}
