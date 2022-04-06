import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/AboutScreen.dart';
import 'package:humanoid_ctse/screens/auth/AdminLoginScreen.dart';
import 'package:humanoid_ctse/screens/HomeScreen.dart';
import 'package:share_plus/share_plus.dart';

class NavigationDrawyerWidget extends StatelessWidget {
  const NavigationDrawyerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 1, 77, 123),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Tap.",
                            style: TextStyle(
                                fontFamily: "Tenorite",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Explore.",
                            style: TextStyle(
                                fontFamily: "Tenorite",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Learn.",
                            style: TextStyle(
                                fontFamily: "Tenorite",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 250,
                child: ListView(
                  children: <Widget>[
                    buildMenuItem(
                        text: 'Home',
                        icon: Icons.home_filled,
                        tapHandler: () {
                          Navigator.of(context).pushNamed(HomeScreen.routeName);
                        }),
                    buildMenuItem(
                        text: 'About',
                        icon: Icons.info,
                        tapHandler: () {
                          Navigator.of(context)
                              .pushNamed(AboutScreen.routeName);
                        }),
                    buildMenuItem(
                      text: 'Share',
                      icon: Icons.share,
                      tapHandler: () {
                        Share.share('Share this app');
                      },
                    ),
                    buildMenuItem(
                        text: 'Admin',
                        icon: Icons.admin_panel_settings,
                        tapHandler: () {
                          Navigator.of(context)
                              .pushNamed(AdminLoginScreen.routeName);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text,
      required IconData icon,
      VoidCallback? tapHandler}) {
    final color = Color.fromARGB(255, 1, 77, 123);

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text,
          style: TextStyle(color: color, fontSize: 20, fontFamily: "Tenorite")),
      onTap: tapHandler,
    );
  }
}
