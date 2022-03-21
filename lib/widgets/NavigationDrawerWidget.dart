import 'package:flutter/material.dart';

class NavigationDrawyerWidget extends StatelessWidget {
  const NavigationDrawyerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            SizedBox(
                height: 230,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 1, 77, 123),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
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
          ],
        ),
      ),
    );
  }
}
