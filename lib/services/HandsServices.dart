import 'package:cloud_firestore/cloud_firestore.dart';

class HandsServices {
  late FirebaseFirestore firestore;
  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  //get all head data
  Future<List> getData() async {
    QuerySnapshot querySnapshot;
    List docs = [];

    try {
      querySnapshot = await firestore.collection("body-hands").get();
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
  Future<void> insertData(
      String imageUrl, String name, String description, List diseases) async {
    try {
      await firestore.collection("body-hands").add({
        'imageUrl': imageUrl,
        'name': name,
        'description': description,
        'diseases': diseases
      });
    } catch (e) {
      print(e);
    }
  }

  //update data
  Future<void> update(String id, String name, String code) async {
    try {
      await firestore
          .collection("body-hands")
          .doc(id)
          .update({'name': name, 'code': code});
    } catch (e) {
      print(e);
    }
  }

  //delete data
  Future<void> delete(String id) async {
    try {
      await firestore.collection("body-hands").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
