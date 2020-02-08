import 'package:fabo_example_app/Bookings%20Page/MyBookings.dart';
import 'package:fabo_example_app/appBar.dart';
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
    theme: ThemeData(
      primarySwatch: Colors.purple,
      primaryColor: Colors.purpleAccent,
    ),
    home: OptionsPage(),
    // home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  PageController pageController =
      new PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    void onPageChange(int _index) {
      setState(() {
        index = _index;
        pageController.animateToPage(_index,
            duration: Duration(milliseconds: 1000), curve: Curves.ease);
      });
    }

    List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(
            'Home',
          )),
      BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
      BottomNavigationBarItem(
          icon: Icon(Icons.work, size: 35), title: Text('My Bookings')),
      BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 35), title: Text('Profile')),
    ];

    @override
    void initState() {
      super.initState();
    }

    Widget _pageView() {
      return new PageView(
        controller: pageController,
        pageSnapping: true,
        onPageChanged: (index) {
          onPageChange(index);
        },
        children: <Widget>[
          HomePage(),
          ChatsPage(),
          Bookings(),
          ProfilePage(),
        ],
      );
    }

    return new Scaffold(
      appBar: app_Bar(context),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purpleAccent[700],
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            onPageChange(index);
          },
          items: bottomItems),
      body: _pageView(),
    );
  }
}
