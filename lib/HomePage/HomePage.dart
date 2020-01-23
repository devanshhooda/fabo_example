import 'package:fabo_example_app/appBar.dart';
import 'package:flutter/material.dart';

PageController pageController = new PageController();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  void onChangeIndex(int i) {
    setState(() {
      index = i;
      // await pageController = pageController.animateToPage(index, duration: Duration(seconds: 2.0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: app_Bar(context),
        bottomNavigationBar: new Container(
          height: 78,
          decoration: BoxDecoration(
              gradient: RadialGradient(
            colors: [Colors.white, Colors.blue],
          )),
          child: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: Colors.purpleAccent[700],
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.home, size: 35),
                    onPressed: () {
                      onChangeIndex(0);
                    },
                  ),
                  title: Text(
                    'Home',
                  )),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(
                      Icons.chat,
                      size: 35,
                    ),
                    onPressed: () {
                      onChangeIndex(1);
                    },
                  ),
                  title: Text('Chats')),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.work, size: 35),
                    onPressed: () {
                      onChangeIndex(2);
                    },
                  ),
                  title: Text('My Bookings')),
              BottomNavigationBarItem(
                  icon: IconButton(
                    icon: Icon(Icons.person, size: 35),
                    onPressed: () {
                      onChangeIndex(3);
                    },
                  ),
                  title: Text('Profile')),
            ],
          ),
        ),
        body: new Container(
          child: new PageView(),
        ));
  }
}


