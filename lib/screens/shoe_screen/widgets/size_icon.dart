import 'package:flutter/material.dart';
import 'package:nike/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class SizeIcon extends StatelessWidget {
  const SizeIcon({
    Key? key,
    required this.size,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String size;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected
              ? Provider.of<ThemeProvider>(context).accentColor
              : Colors.white,
        ),
        child: Center(
          child: Text(
            size,
            style: kText18.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              // fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
