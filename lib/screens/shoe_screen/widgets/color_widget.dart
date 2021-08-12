import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget(
      {Key? key,
      required this.color,
      required this.onPressed,
      required this.isSelected})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  width: 3,
                  color: Colors.white,
                )
              : Border(),
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
