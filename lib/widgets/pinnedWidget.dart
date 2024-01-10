import 'package:flutter/material.dart';
import 'package:todolistgroup/theme/Palette.dart';

class PinnedWidget extends StatelessWidget {
  String? icon ;
  void Function()? onPressed;

  PinnedWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(0, 0, 0, 0.2)),
        child: Image.asset(
          icon ?? "assets/icons/pencil.png",
          scale: 30,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
