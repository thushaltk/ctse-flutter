import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/AddHeadPartsScreen.dart';
import 'package:humanoid_ctse/screens/AdminLoginScreen.dart';
import 'package:humanoid_ctse/screens/DashboardAdminScreen.dart';
import 'package:humanoid_ctse/screens/DashboardHeadScreen.dart';
import 'package:humanoid_ctse/screens/HomeScreen.dart';
import 'package:humanoid_ctse/services/HeadServices.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(1, 77, 123, .1),
  100: Color.fromRGBO(1, 77, 123, .2),
  200: Color.fromRGBO(1, 77, 123, .3),
  300: Color.fromRGBO(1, 77, 123, .4),
  400: Color.fromRGBO(1, 77, 123, .5),
  500: Color.fromRGBO(1, 77, 123, .6),
  600: Color.fromRGBO(1, 77, 123, .7),
  700: Color.fromRGBO(1, 77, 123, .8),
  800: Color.fromRGBO(1, 77, 123, .9),
  900: Color.fromRGBO(1, 77, 123, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF014D7B, color);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  HeadServices? headServices;

  initialise() {
    headServices = HeadServices();
    headServices!.initialise();
    headServices!.getData().then(((value) => print(value)));
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUMANOID',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: colorCustom,
      ),
      home: const HomeScreen(),
      routes: {
        AdminLoginScreen.routeName: (ctx) => const AdminLoginScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        DashboardAdminScreen.routeName : (ctx) => const DashboardAdminScreen(),
        DashboardHeadScreen.routeName : (ctx) => const DashboardHeadScreen(),
        AddHeadPartsScreen.routeName : (ctx) => AddHeadPartsScreen(headServices: headServices!)
      },
    );
  }
}
