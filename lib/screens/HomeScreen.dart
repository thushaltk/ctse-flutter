import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  void initState(){
    super.initState();
    loadSvgImage(svgImage: svgimage);
  }

  void _onTap(BuildContext context, Offset globalPosition) {
    RenderObject? renderBox = context.findRenderObject();
    if (renderBox is RenderBox) {
      final localPosition = renderBox.globalToLocal(globalPosition);
      print(localPosition);
    }
  }

  Future<void> loadSvgImage(
      {required String svgImage}) async {
    String generalString = await rootBundle.loadString(svgImage);

    XmlDocument document = XmlDocument.parse(generalString);

    final paths = document.findAllElements('path');

    for (var element in paths) {
      String partName = element.getAttribute('id').toString();
      String partPath = element.getAttribute('d').toString();

      if (!partName.contains('path')) {
        GeneralBodyPart part = GeneralBodyPart(name: partName, path: partPath);
        generalBodyParts.add(part);
      }
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
          padding: const EdgeInsets.all(28.0),
          child: GestureDetector(
              onTapDown: (details) => _onTap(context, details.globalPosition),
              child: CanvasTouchDetector(
                builder: ((context) => CustomPaint( 
                  painter: BodyPainter(
                    context: context,
                    model: generalBodyParts
                  ),
                ))
              )
            )
          ),
    );
  }
}

class BodyPainter extends CustomPainter {
  final BuildContext context;
  final List<GeneralBodyPart> model;

  BodyPainter({
    required this.context,
    required this.model
  });

  @override
  void paint(Canvas canvas, Size size) {
  
    var myCanvas = TouchyCanvas(context, canvas);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 8.0;

    // Scale each path to match canvas size
    var xScale = size.width / 222;
    var yScale = size.height / 400;
    final Matrix4 matrix4 = Matrix4.identity();

    matrix4.scale(xScale, yScale);

    Path? bodyPath;

    List<GeneralBodyPart> generalParts = model;

    for (var muscle in generalParts) {
      Path path = parseSvgPath(muscle.path);
      paint.color = Colors.white10;
      myCanvas.drawPath(
        path.transform(matrix4.storage),
        paint,
        onTapDown: (details) {
          //model.selectGeneralBodyPart(muscle.name);
        },
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
