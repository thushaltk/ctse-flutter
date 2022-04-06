import 'package:flutter/material.dart';

class DisplayDataScreen extends StatelessWidget {
  static const routeName = '/view';

  final String name;
  final String imageUrl;
  final String description;
  final String diseases;

  DisplayDataScreen(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.description,
      required this.diseases})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List tempDiseasesSplit = diseases.split(",");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  imageUrl,
                  height: 280,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    name,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontFamily: 'Tenorite',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Tenorite',
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 8.0),
              child: Text("Diseases",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Tenorite',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: tempDiseasesSplit.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                      child: Text(
                        '-${tempDiseasesSplit[index]}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'Tenorite',
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
