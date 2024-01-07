import 'package:flutter/material.dart';
import 'package:todolistgroup/theme/Palette.dart';

class PinnedWidget extends StatelessWidget {
  Widget icon;
  void Function()? onPressed;

  PinnedWidget({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Palette.cardColor),
      ),
      color: Colors.grey[500],
    );
  }
}
