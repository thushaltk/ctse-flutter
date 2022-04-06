import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/AboutScreen.dart';
import 'package:humanoid_ctse/screens/AddHandsPartsScreen.dart';
import 'package:humanoid_ctse/screens/AddHeadPartsScreen.dart';
import 'package:humanoid_ctse/screens/AddLegsPartsScreen.dart';
import 'package:humanoid_ctse/screens/AddTorsoPartsScreen.dart';
import 'package:humanoid_ctse/screens/DisplayHandsItems.dart';
import 'package:humanoid_ctse/screens/DisplayHeadItems.dart';
import 'package:humanoid_ctse/screens/DisplayLegsItems.dart';
import 'package:humanoid_ctse/screens/DisplayTorsoItems.dart';
import 'package:humanoid_ctse/screens/auth/AdminLoginScreen.dart';
import 'package:humanoid_ctse/screens/DashboardAdminScreen.dart';
import 'package:humanoid_ctse/screens/DashboardHandsScreen.dart';
import 'package:humanoid_ctse/screens/DashboardHeadScreen.dart';
import 'package:humanoid_ctse/screens/DashboardLegsScreen.dart';
import 'package:humanoid_ctse/screens/DashboardTorsoScreen.dart';
import 'package:humanoid_ctse/screens/EditHeadPartScreen.dart';
import 'package:humanoid_ctse/screens/HomeScreen.dart';
import 'package:humanoid_ctse/screens/auth/AdminSignupScreen.dart';
import 'package:humanoid_ctse/services/AuthServices.dart';
import 'package:humanoid_ctse/services/HandsServices.dart';
import 'package:humanoid_ctse/services/HeadServices.dart';
import 'package:humanoid_ctse/services/LegsServices.dart';
import 'package:humanoid_ctse/services/TorsoServices.dart';
import 'package:provider/provider.dart';

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
  HandsServices? handsServices;
  LegsServices? legsServices;
  TorsoServices? torsoServices;

  initialiseHeadService() {
    headServices = HeadServices();
    headServices!.initialise();
  }

  initialiseHandService() {
    handsServices = HandsServices();
    handsServices!.initialise();
  }

  initaliseLegsService() {
    legsServices = LegsServices();
    legsServices!.initialise();
  }

  initaliseTorsoService() {
    torsoServices = TorsoServices();
    torsoServices!.initialise();
  }

  @override
  void initState() {
    super.initState();
    initialiseHeadService();
    initialiseHandService();
    initaliseLegsService();
    initaliseTorsoService();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: AuthService())],
        child: Consumer<AuthService>(
          builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'HUMANOID',
            theme: ThemeData(
              primarySwatch: colorCustom,
            ),
            home: HomeScreen(),
            routes: {
              AdminLoginScreen.routeName: (ctx) => const AdminLoginScreen(),
              AdminSignupScreen.routeName: (ctx) => const AdminSignupScreen(),
              HomeScreen.routeName: (ctx) => HomeScreen(),
              DashboardAdminScreen.routeName: (ctx) =>
                  const DashboardAdminScreen(),
              DashboardHeadScreen.routeName: (ctx) =>
                  const DashboardHeadScreen(),
              DashboardHandsScreen.routeName: (ctx) =>
                  const DashboardHandsScreen(),
              DashboardTorsoScreen.routeName: (ctx) =>
                  const DashboardTorsoScreen(),
              DashboardLegsScreen.routeName: (ctx) =>
                  const DashboardLegsScreen(),
              AddHeadPartsScreen.routeName: (ctx) =>
                  AddHeadPartsScreen(headServices: headServices!),
              AddLegsPartsScreen.routeName: (ctx) =>
                  AddLegsPartsScreen(legsServices: legsServices!),
              AddHandsPartsScreen.routeName: (ctx) =>
                  AddHandsPartsScreen(handsServices: handsServices!),
              AddTorsoPartsScreen.routeName: (ctx) =>
                  AddTorsoPartsScreen(torsoServices: torsoServices!),
              DisplayHeadItems.routeName: (ctx) => const DisplayHeadItems(),
              DisplayHandsItems.routeName: (ctx) => const DisplayHandsItems(),
              DisplayLegsItems.routeName: (ctx) => const DisplayLegsItems(),
              DisplayTorsoItems.routeName: (ctx) => const DisplayTorsoItems(),
              AboutScreen.routeName: (ctx) => const AboutScreen()
            },
          ),
        ));
  }
}
