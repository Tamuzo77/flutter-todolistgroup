import 'package:flutter/material.dart';
import 'package:todolistgroup/theme/Palette.dart';
class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        child: TextField(
        decoration: InputDecoration(
          suffixIcon: Image.asset(
              'assets/icons/loupe.png',
            scale: 20,
            color: Colors.grey[400],
          ),
          hintText: "Search task",
          hintStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          fillColor: Color.fromRGBO(36, 39, 51, 1.0),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
          )
        ),),

      ),
    );
  }
}
