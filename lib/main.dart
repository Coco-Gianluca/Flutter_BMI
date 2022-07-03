import 'package:bmi/widget/button_widget.dart';
import 'package:bmi/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Welcome';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.blue),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    // endDrawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(MyApp.title),
    ),
    body: Builder(
      builder: (context) => Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ButtonWidget(
          icon: Icons.open_in_new,
          text: 'Open Drawer',
          onClicked: () {
            Scaffold.of(context).openDrawer();
            // Scaffold.of(context).openEndDrawer();
          },
        ),



      ),
    ),
  );
}





