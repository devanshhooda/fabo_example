import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fabo_example_app/appBar.dart';
import 'package:fabo_example_app/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home Page/HomePage.dart';
import 'Login - Sign up/options.dart';
import 'Profile Page/profile_page.dart';
import 'Request Page/requestsPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      primaryColor: Colors.indigoAccent,
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
            duration: Duration(milliseconds: 270), curve: Curves.ease);
      });
    }

    // List<BottomNavigationBarItem> bottomItems = [
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       title: Text(
    //         'Home',
    //       )),
    //   // BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.work, size: 35), title: Text('My Bookings')),
    //   BottomNavigationBarItem(
    //       icon: Icon(Icons.person, size: 35), title: Text('Profile')),
    // ];

    List<BottomNavyBarItem> bottomItems = [
      BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.deepPurpleAccent,
          inactiveColor: Colors.grey),
      BottomNavyBarItem(
          icon: Icon(Icons.mobile_screen_share),
          title: Text('Requests'),
          activeColor: Colors.blue,
          inactiveColor: Colors.grey),
      BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.pink,
          inactiveColor: Colors.grey),
    ];

    @override
    void initState() {
      super.initState();
    }

    Widget _pageView() {
      return new PageView(
        controller: pageController,
        onPageChanged: (index) {
          onPageChange(index);
        },
        children: <Widget>[
          HomePage(),
          Requests(),
          ProfilePage(),
        ],
      );
    }

    SizeConfig().init(context);

    return new Scaffold(
      appBar: app_Bar(context),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.ease,
        // showElevation: false,
        iconSize: SizeConfig.blockSizeHorizontal * 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        items: bottomItems,
        selectedIndex: index,
        onItemSelected: (index) {
          onPageChange(index);
        },
        // backgroundColor: Color.fromARGB(225, 255, 225, 255),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     iconSize: 30,
      //     currentIndex: index,
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.purpleAccent[700],
      //     unselectedItemColor: Colors.grey,
      // onTap: (index) {
      //   onPageChange(index);
      // },
      //     items: bottomItems),
      body: _pageView(),
    );
  }
}
