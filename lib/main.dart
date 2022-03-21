import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/HomeScreen.dart';

Map<int, Color> color =
{
50:Color.fromRGBO(1,77,123, .1),
100:Color.fromRGBO(1,77,123, .2),
200:Color.fromRGBO(1,77,123, .3),
300:Color.fromRGBO(1,77,123, .4),
400:Color.fromRGBO(1,77,123, .5),
500:Color.fromRGBO(1,77,123, .6),
600:Color.fromRGBO(1,77,123, .7),
700:Color.fromRGBO(1,77,123, .8),
800:Color.fromRGBO(1,77,123, .9),
900:Color.fromRGBO(1,77,123, 1),
};

MaterialColor colorCustom = MaterialColor(0xFF014D7B, color);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
    );
  }
}
