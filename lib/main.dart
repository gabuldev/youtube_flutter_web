import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:interact/pages/home/home_page.dart';

void main() {
  initializeApp(
      apiKey: "AIzaSyBEwwE9WxB1CTSSP65qN7Q4sgOun-Y5o_M",
      authDomain: "flutter-f98f5.firebaseapp.com",
      databaseURL: "https://flutter-f98f5.firebaseio.com",
      projectId: "flutter-f98f5",
      storageBucket: "flutter-f98f5.appspot.com",
      messagingSenderId: "461978783271",
      appId: "1:461978783271:web:08b982ce686cf16c548802",
      measurementId: "G-FLYJP8RX4X");

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
