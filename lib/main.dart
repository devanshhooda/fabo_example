import 'package:fabo_example_app/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './HomePage/HomePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    // darkTheme: ThemeData(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.purpleAccent,
    ),
    home: HomePage(),
//     home: ProfilePage(), 
  ));
}
