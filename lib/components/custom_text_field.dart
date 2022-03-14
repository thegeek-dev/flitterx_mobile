// @dart=2.9
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  const CustomTextField({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.3,
      decoration: BoxDecoration(
          color: Colors.white10, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white30)),
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}
