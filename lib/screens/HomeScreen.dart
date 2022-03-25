import 'package:flutter/material.dart';
import 'package:humanoid_ctse/widgets/NavigationDrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawyerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          )),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(28.0),
            child: Image.asset('assets/images/body.png', fit: BoxFit.contain,)),
    );
  }
}
