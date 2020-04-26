import 'package:fabo_example_app/views/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'utils/sizeConfig.dart';
import 'views/appBar.dart';
import 'views/screens/homePage.dart';
import 'views/screens/profilePage.dart';
import 'views/screens/requestsPage.dart';
import 'package:fabo_example_app/services/userSignUp.dart';
import './services/userSignUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(PrizeyCustomerApp());
}

class PrizeyCustomerApp extends StatelessWidget {
  // UserAuth auth = UserAuth();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserAuth>(
      create: (context) => UserAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginCheck(),
      ),
    );
  }
}

class LoginCheck extends StatefulWidget {
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    UserAuth _auth = Provider.of<UserAuth>(context);
    return FutureBuilder(
        future: _auth.getUserStatusFromSP(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return MyApp();
          } else {
            return OptionsPage();
          }
        });
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
