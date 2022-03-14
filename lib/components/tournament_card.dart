import 'package:cached_network_image/cached_network_image.dart';
import 'package:flitterx_mobile/samples/tournament_data.dart';
import 'package:flutter/material.dart';

class TournamentCard extends StatelessWidget {
  final String date;
  final String place;
  final String caption;
  final String imgUrl;

  const TournamentCard({
    Key? key,
    required this.date,
    required this.place,
    required this.caption,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 20,
        ),
        Container(
          //height: size.height / 2,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 75, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedNetworkImage(
                    width: size.width / 1.2,
                    height: size.height / 3,
                    imageUrl: imgUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fitHeight,
                  )
                  /*Image.network(
                    imgUrl,
                    width: size.width / 1.2,
                    height: size.height / 3,
                    fit: BoxFit.fitHeight,
                  )*/
                  ,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height / 3.8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width / 14,
                    ),
                    child: Text(
                      caption,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width / 14,
                    ),
                    child: Row(
                      children: [
                        Text(
                          place,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          ", ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.w100),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 25,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
