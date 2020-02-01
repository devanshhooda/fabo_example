import 'package:fabo_example_app/Bookings%20Page/MyBookings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Chat Page/chatsPage.dart';
import 'Home Page/HomePage.dart';
import 'Login - Sign up/options.dart';
import 'Profile Page/profile_page.dart';

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
    // home: ProfilePage(),
    // home: HomePage(),
    // home: ChatsPage(),
    // home: Bookings(),
    home: OptionsPage(),
  ));
}
