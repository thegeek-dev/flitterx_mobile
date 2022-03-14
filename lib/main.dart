// @dart=2.9

import 'package:flitterx_mobile/flutterfire/sign_in.dart';
import 'package:flitterx_mobile/ui/landing_page.dart';
import 'package:flitterx_mobile/ui/tournament_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      try {
        signInWithGoogle();
      } catch (e) {
        print(e);
      }
    } else {
      print("User is signed in!");
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlitterX',
      theme: ThemeData(
        // This is the theme of your
        // application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}
