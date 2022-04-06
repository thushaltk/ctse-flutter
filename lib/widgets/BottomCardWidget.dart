import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/DisplayDataScreen.dart';
import 'package:humanoid_ctse/screens/DisplayHandsItems.dart';
import 'package:humanoid_ctse/screens/DisplayHeadItems.dart';
import 'package:humanoid_ctse/screens/DisplayLegsItems.dart';
import 'package:humanoid_ctse/screens/DisplayTorsoItems.dart';

class BottomCardWidget extends StatelessWidget {
  final String name;

  const BottomCardWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        name == "HEAD"
            ? Navigator.of(context).pushNamed(DisplayHeadItems.routeName)
            : name == "HANDS"
                ? Navigator.of(context).pushNamed(DisplayHandsItems.routeName)
                : name == "LEGS"
                    ? Navigator.of(context)
                        .pushNamed(DisplayLegsItems.routeName)
                    : name == "TORSO"
                        ? Navigator.of(context)
                            .pushNamed(DisplayTorsoItems.routeName)
                        : '';
      },
      child: SizedBox(
        height: double.infinity,
        width: 98,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: const Color.fromARGB(255, 1, 77, 123),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Tenorite',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
