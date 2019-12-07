import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:interact/pages/home/home_page.dart';

void main() {
  initializeApp(
      apiKey: "AIzaSyA4WT3pIJnT2miR8GbB2NB1X_A2rlDlYNI",
      authDomain: "clone-flutter.firebaseapp.com",
      databaseURL: "https://clone-flutter.firebaseio.com",
      projectId: "youtube-clone-flutter",
      storageBucket: "youtube-clone-flutter.appspot.com",
      messagingSenderId: "505639471224",
      appId: "1:505639471224:web:79acfbf0944ecc5abc858d",
      measurementId: "G-S7D7C7RSM1");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter YouTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
