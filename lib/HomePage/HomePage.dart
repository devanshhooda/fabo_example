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
          child: new ListView(
            children: <Widget>[
              _content('Categories', 'Element'),
              _content('Recommended for you', 'Element'),
              _content('Special offers', 'Element'),
              _content('Top offers', 'Element'),
              _content('Favourites', 'Element'),
            ],
          ),
        ));
  }
}

Widget _content(String title, String subtitle) {
  return new Container(
    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
    child: new Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        new Container(
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(150, 255, 255, 255),
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                  ),
                  new Text(
                    title,
                    style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 240),
                  // ),
                  new IconButton(
                    // alignment: Alignment(50,0),
                    onPressed: () => print('$title Page'),
                    icon: Icon(
                      Icons.chevron_right,
                      size: 25,
                    ),
                  )
                ],
              ),
              new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    _elements(subtitle),
                    _elements(subtitle),
                    _elements(subtitle),
                    _elements(subtitle),
                    _elements(subtitle),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _elements(String subtitle) {
  return new Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, right: 10),
      height: 140,
      width: 150,
      child: new GestureDetector(
        onTap: () => print('Details of Service'),
        child: new Card(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              new FlutterLogo(
                size: 70,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              new Text(
                subtitle,
              )
            ],
          ),
        ),
      ));
}
