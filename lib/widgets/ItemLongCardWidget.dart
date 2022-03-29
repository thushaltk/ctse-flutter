import 'package:flutter/material.dart';

class ItemLongCardWidget extends StatelessWidget {
  final String? id;
  final String? imageUrl;
  final String? name;
  final String? description;
  final List? diseases = [];

  ItemLongCardWidget(
      {Key? key,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: Image.network(
                  imageUrl!,
                  width: 80,
                  height: 80,
                ),
              ),
              Text(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Tenorite',
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    height: 100,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          //Navigator.of(context).pushNamed(DashboardHeadScreen.routeName);
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 30.0,
                          semanticLabel: "Settings icon",
                        ),
                      ),
                    ),
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
                          color: Colors.red,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.of(context).pushNamed(DashboardHeadScreen.routeName);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 30.0,
                            semanticLabel: "Settings icon",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
