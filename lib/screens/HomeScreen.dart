import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humanoid_ctse/widgets/BottomCardWidget.dart';
import 'package:humanoid_ctse/widgets/NavigationDrawerWidget.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:touchable/touchable.dart';
import 'package:xml/xml.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/GeneralBodyPart.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<GeneralBodyPart> generalBodyParts = [];
  final String svgimage = 'assets/images/body.svg';

  @override
  void initState() {
    super.initState();
  }

  void _onTap(BuildContext context, Offset globalPosition) {
    RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final localPosition = renderBox.globalToLocal(globalPosition);
      print(localPosition);
    }
  }

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
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 500,
              width: double.infinity,
              child: Image.asset(
                'assets/images/body.png',
                fit: BoxFit.contain,
              ),
            ),
            
            Container(
              width: double.infinity,
              height: 53,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BottomCardWidget(name: "HEAD"),
                  BottomCardWidget(name: "HANDS"),
                  BottomCardWidget(name: "TORSO"),
                  BottomCardWidget(name: "LEGS"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
