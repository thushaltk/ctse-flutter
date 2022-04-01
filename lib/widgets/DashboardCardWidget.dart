import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/DashboardHeadScreen.dart';

class DashboardCardWidget extends StatefulWidget {
  final String routename;
  final Image imageUrl;
  final String name;

  const DashboardCardWidget({ Key? key, required this.imageUrl, required this.name, required this.routename }) : super(key: key);

  @override
  State<DashboardCardWidget> createState() => _DashboardCardWidgetState();
}

class _DashboardCardWidgetState extends State<DashboardCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 10.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Card(     
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: widget.imageUrl,
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Tenorite',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 1, 77, 123),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(widget.routename);
                          },
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 30.0,
                            semanticLabel: "Settings icon",
                          ),
                        ),
                      ),
                    ),
                  )

                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}