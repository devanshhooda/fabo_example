import 'package:fabo_example_app/views/screens/enterDetails.dart';
import 'package:fabo_example_app/views/screens/numberSignUp.dart';
import 'package:fabo_example_app/views/screens/options.dart';
import 'package:fabo_example_app/views/screens/signUpOtp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'utils/sizeConfig.dart';
import 'views/appBar.dart';
import 'views/screens/homePage.dart';
import 'views/screens/profilePage.dart';
import 'views/screens/requestsPage.dart';
import 'package:fabo_example_app/services/userSignUp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(PrizeyCustomerApp());
}

class PrizeyCustomerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserAuth>(
          create: (context) => UserAuth(),
          child: PhoneNumber(),
        ),
        ChangeNotifierProvider<UserAuth>(
          create: (context) => UserAuth(),
          child: Password(''),
        ),
        ChangeNotifierProvider<UserAuth>(
          create: (context) => UserAuth(),
          child: NameSignUp(''),
        ),
      ],
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigoAccent,
        ),
        home: OptionsPage(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Tab> pages = [
      Tab(
        icon: Icon(
          Icons.home,
        ),
      ),
      Tab(
        icon: Icon(Icons.mobile_screen_share),
      ),
      Tab(
        icon: Icon(Icons.person),
      ),
    ];

    SizeConfig().init(context);

    TabController controller = TabController(length: 3, vsync: this);

    return new Scaffold(
      appBar: app_Bar(context),
      bottomNavigationBar: Material(
        color: Colors.indigo,
        child: TabBar(
          tabs: pages,
          controller: controller,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        children: <Widget>[HomePage(), Requests(), ProfilePage()],
        controller: controller,
      ),
    );
  }
}
