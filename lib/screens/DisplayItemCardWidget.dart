import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/DashboardHeadScreen.dart';
import 'package:humanoid_ctse/screens/DisplayDataScreen.dart';

class DisplayItemCardWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String diseases;

  const DisplayItemCardWidget(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.diseases})
      : super(key: key);

  @override
  State<DisplayItemCardWidget> createState() => _DisplayItemCardWidgetState();
}

class _DisplayItemCardWidgetState extends State<DisplayItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 10,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  widget.imageUrl,
                  width: 90,
                  height: 90,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Tenorite',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0)),
                  child: SizedBox(
                    width: 80,
                    height: 100,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 1, 77, 123),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayDataScreen(
                                        description: widget.description,
                                        imageUrl: widget.imageUrl,
                                        name: widget.name,
                                        diseases: widget.diseases,
                                      )));
                        },
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                          size: 30.0,
                          semanticLabel: "View icon",
                        ),
                      ),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
