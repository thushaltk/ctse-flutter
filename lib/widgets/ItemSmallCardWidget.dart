import 'package:flutter/material.dart';

class ItemSmallCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final String? description;
  final List? diseases = [];

  ItemSmallCardWidget(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 10,
        child: Column(
          children: [
            Image.network(imageUrl!, width: 80, height: 80),
            Text(name!)
          ],
        ),
      ),
    );
  }
}
