// @dart=2.9

import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String title;
  final String data;
  const DetailCard({Key key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(232, 43, 43, 48),
        borderRadius: BorderRadius.circular(15),
      ),
      height: size.height / 5,
      width: size.width / 2.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: size.width / 25,
                    fontWeight: FontWeight.w100)),
          ),
          SizedBox(
            height: size.height / 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              data,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width / 22,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
