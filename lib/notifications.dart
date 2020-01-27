import 'package:fabo_example_app/appBar.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: app_Bar(context), body: notifs());
  }
}

Widget notifs() {
  return new ListView(
    children: <Widget>[
      new ListTile(
          leading: notifPhoto(),
          title: new Container(
            padding: EdgeInsets.only(top: 10),
            child: Text('Notification title'),
          ),
          subtitle: new Container(
            // padding: EdgeInsets.all(10),
            child: new Text(
                'Here the subtitle aur description may come or this may bhi removed...'),
          )),
      new Divider()
    ],
  );
}

Widget notifPhoto() {
  return new Container(
    child: new CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[300],
      child: FlutterLogo(
        size: 35,
      ),
    ),
  );
}
