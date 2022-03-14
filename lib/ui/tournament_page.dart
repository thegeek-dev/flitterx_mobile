// @dart=2.9

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flitterx_mobile/components/detail_card.dart';
import 'package:flitterx_mobile/ui/reg_form.dart';
import 'package:flutter/material.dart';

class TournamentPage extends StatefulWidget {
  const TournamentPage({Key key}) : super(key: key);

  @override
  State<TournamentPage> createState() => _TournamentPageState();
}

class _TournamentPageState extends State<TournamentPage> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2727 ";

    String filler = bullet +
        " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere libero eget lorem iaculis cursus. Cras porttitor ullamcorper odio, sed ultricies felis facilisis finibus. Sed erat lorem, tempus ut dignissim vel, commodo id odio."
            "\n\n" +
        bullet +
        " Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam in ligula at orci tincidunt lacinia posuere in elit. Aliquam posuere venenatis facilisis. Praesent aliquet est mi, blandit auctor nunc tristique eget. ";

    Color accent = const Color.fromRGBO(0, 0, 75, 1);
    Color bgColor = const Color.fromRGBO(0, 0, 20, 1);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: accent,
        title: Text("Tournament"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: bgColor,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 30,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      width: size.width / 1.1,
                      height: size.height / 3,
                      imageUrl:
                          "https://i.ibb.co/VBhrpR0/81b-Rac-T8el-L-SL1500.jpg",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Center(
                  child: Text(
                    "BGMI Tournament",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("14th March, College, Jaipur",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 25,
                            fontWeight: FontWeight.w100)),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailCard(
                      title: "Time",
                      data: "5:00 PM",
                    ),
                    DetailCard(
                      title: "Entry Fee",
                      data: "Rs. 99",
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailCard(
                      title: "Check-in Time",
                      data: "15 min before start",
                    ),
                    DetailCard(
                      title: "Format",
                      data: "Battle Royale",
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DetailCard(
                      title: "Team Size",
                      data: "1 Person",
                    ),
                    DetailCard(
                      title: "Prizes",
                      data: "Rs. 5000",
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height / 25),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegForm()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          overlayColor:
                              MaterialStateProperty.all(Colors.white54),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Container(
                          width: size.width / 2,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width / 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height / 30),
                  child: Text(
                    "Instructions :",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 19,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.height / 30,
                    0,
                    size.height / 30,
                    size.height / 30,
                  ),
                  child: Text(filler,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 25,
                          fontWeight: FontWeight.w100)),
                ),
                Padding(
                  padding: EdgeInsets.all(size.height / 30),
                  child: Text(
                    "Rules :",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 19,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.height / 30,
                    0,
                    size.height / 30,
                    size.height / 30,
                  ),
                  child: Text(filler,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 25,
                          fontWeight: FontWeight.w100)),
                )
              ],
            )),
      ),
    ));
  }
}
