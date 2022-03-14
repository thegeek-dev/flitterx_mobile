// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flitterx_mobile/flutterfire/sign_in.dart';
import 'package:flitterx_mobile/samples/tournament_data.dart';
import 'package:flitterx_mobile/ui/tournament_page.dart';
import 'package:flutter/material.dart';

import '../components/tournament_card.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    String photoUrl = /*FirebaseAuth.instance.currentUser.photoURL ??*/ "null";
    Color accent = const Color.fromRGBO(0, 0, 75, 1);
    List tmtData = trnmtData;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: const Color.fromRGBO(0, 0, 20, 1),
          appBar: AppBar(
            backgroundColor: accent,
            title: const Text("FlitterX"),
            actions: [
              photoUrl != "null"
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        photoUrl,
                      ),
                    )
                  : IconButton(
                      onPressed: () {}, icon: const Icon(Icons.person)),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          // bottomNavigationBar: BottomAppBar(
          //   elevation: 15,
          //   child: SizedBox(
          //     height: size.height / 16,
          //     child: Material(
          //       color: accent,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           IconButton(
          //             padding: const EdgeInsets.all(0),
          //             onPressed: () {},
          //             icon: Icon(
          //               Icons.games,
          //               size: size.height / 22,
          //               color: Colors.white,
          //             ),
          //           ),
          //           IconButton(
          //             padding: const EdgeInsets.all(0),
          //             onPressed: () {},
          //             icon: Icon(
          //               Icons.home,
          //               size: size.height / 22,
          //               color: Colors.white,
          //             ),
          //           ),
          //           IconButton(
          //             padding: const EdgeInsets.all(0),
          //             onPressed: () {},
          //             icon: Icon(
          //               Icons.feed,
          //               size: size.height / 22,
          //               color: Colors.white,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10), color: accent),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Current Tournaments",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10), color: accent),
                    //   child: const Padding(
                    //     padding: EdgeInsets.all(15.0),
                    //     child: Text(
                    //       "Previous\nTournaments",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('CurrentTournaments')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          return ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;
                              return GestureDetector(
                                onTap: (() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TournamentPage()),
                                  );
                                }),
                                child: TournamentCard(
                                  date: data['date'],
                                  place: data['place'],
                                  caption: data['Name'],
                                  imgUrl: data['imgUrl'],
                                ),
                              );
                            }).toList(),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}









/* ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: tmtData.length,
                        itemBuilder: (context, index) {
                          return TournamentCard(
                            caption: tmtData[index]["caption"],
                            place: tmtData[index]["place"],
                            date: tmtData[index]["date"],
                            imgUrl: tmtData[index]["imgUrl"],
                          );
                        })*/