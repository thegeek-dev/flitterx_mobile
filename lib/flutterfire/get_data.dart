import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetData extends StatelessWidget {
  final String documentId;

  GetData(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference CT =
        FirebaseFirestore.instance.collection('CurrentTournaments');

    return FutureBuilder<DocumentSnapshot>(
      future: CT.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            data['date'],
            style: TextStyle(color: Colors.white),
          );
        }

        return Text("loading");
      },
    );
  }
}
