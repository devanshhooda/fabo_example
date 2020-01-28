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
              _categories('Categories', 'Element'),
              _categories('Recommended for you', 'Element'),
              _categories('Special offers', 'Element'),
              _categories('Top offers', 'Element'),
              _categories('Favourites', 'Element'),
            ],
          ),
        ));
  }
}

Widget _categories(String title, String subtitle) {
  return new Container(
    padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
    child: new Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        new Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 40.0,
                  spreadRadius: 5.0,
                  offset: Offset(
                    10.0,
                    30.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(200, 255, 255, 255),
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            children: <Widget>[
              new FlatButton(
                onPressed: () => print('$title page'),
                child: new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    new Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 200,),
                    // ),
                    new Icon(
                      Icons.chevron_right,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              new SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: new Row(
                  children: <Widget>[
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
                    _services(subtitle),
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

Widget _services(String subtitle) {
  return new Container(
      padding: EdgeInsets.only(left: 10, bottom: 10),
      height: 150,
      width: 150,
      child: new GestureDetector(
        onTap: () => print('Details of Service'),
        child: new Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              new FlutterLogo(
                size: 80,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              new Text(
                subtitle,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ));
}
