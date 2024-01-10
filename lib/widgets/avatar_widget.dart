import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.only(left: 15),
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 50,
            child: Text(
              "H4",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
          Text(
            "Hospice44",
            style: GoogleFonts.gabriela(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text("f"),
        ],
      ),
    );
  }
}
