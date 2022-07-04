import 'package:bmi/l10n/l10n.dart';
import 'package:bmi/widget/button_widget.dart';
import 'package:bmi/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


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
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    supportedLocales: L10n.all,
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],

    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text(MyApp.title),
    ),
    /*body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        SizedBox(
          width: 400,
             child: Text(
              'Your BMI is a number based on your height, weight and age.\nEach of these are divided into three categories: under 18.5, 18.5-24 and 25-29.9. For women it is considered normal to be around 18.5 and 25 for men to be over 30. A reading of over 30 is considered overweight. For example, if you are a woman and have a BMI of 24.9 then you are considered overweight.'
                  'Weight gain over the last year is common for most people in their mid-thirties. More specifically, women are at a higher risk of gaining weight than men. A study by the International Journal of Epidemiology (IJE) examined how BMI has changed from 1985-1995. The results revealed a very significant rise in weight gain amongst women aged 30 and above, and this was found to be both a cause and consequence of life events.'
                  'Drinking habits have changed dramatically over the last 20 years. More and more women are choosing to drink more wine than beer. This results in women having a higher rate of alcohol intake than men.',
                  style:TextStyle(
                    fontSize: 20,




             ),
             )
          ),
      ],

      ),
    */);

}





