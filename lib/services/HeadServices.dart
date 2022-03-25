import 'package:cloud_firestore/cloud_firestore.dart';

class HeadServices {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  //get all head data
  Future<List> getData() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try {
      querySnapshot = await firestore.collection('body-head').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map temp = {
            "id": doc.id,
            "imageURL": doc['imageURL'],
            "name": doc['name'],
            "description": doc['description'],
            "diseases": doc['diseases']
          };
          docs.add(temp);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  //add data



  //update data



  //delete data
  
}
