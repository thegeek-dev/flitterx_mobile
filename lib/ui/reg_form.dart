// @dart=2.9
import 'package:flutter/material.dart';

class RegForm extends StatefulWidget {
  const RegForm({Key key}) : super(key: key);

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  @override
  Widget build(BuildContext context) {
    Color accent = const Color.fromRGBO(0, 0, 75, 1);
    Color bgColor = const Color.fromRGBO(0, 0, 20, 1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: accent,
          title: const Text("Register"),
        ),
        body: Container(constraints: BoxConstraints.expand(), color: bgColor),
      ),
    );
  }
}
