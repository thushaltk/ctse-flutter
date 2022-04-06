import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:humanoid_ctse/services/HandsServices.dart';
import 'package:humanoid_ctse/services/HeadServices.dart';
import 'package:image_picker/image_picker.dart';

class AddHandsPartsScreen extends StatefulWidget {
  static const routeName = '/add-hands-parts';
  final HandsServices handsServices;

  const AddHandsPartsScreen({Key? key, required this.handsServices}) : super(key: key);

  @override
  State<AddHandsPartsScreen> createState() => _AddHandsPartsScreenState();
}

class _AddHandsPartsScreenState extends State<AddHandsPartsScreen> {
  XFile? _imagefile;
  String? imageURL;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController diseasesController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  Future pickImage() async {
    final selectedFile = await _picker.pickImage(source: ImageSource.gallery);
    final url = await uploadImagetoFirebase(selectedFile!);

    setState(() {
      _imagefile = selectedFile;
      imageURL = url;
    });
  }

  Future<String> uploadImagetoFirebase(XFile _image) async {
    var url;
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("uploads/" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(File(_image.path));
    await uploadTask.whenComplete(() async {
      try{
        url = await ref.getDownloadURL();
      }catch(onError){
        print("error");
      }
    });

    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: DecoratedBox(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 1, 77, 123)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 10.0, 0, 0),
                              child: Text(
                                "Add New Part",
                                style: TextStyle(
                                    fontFamily: "Tenorite",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  Column(children: [
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: _imagefile != null
                                  ? Image.file(File(_imagefile!.path))
                                  : ElevatedButton(
                                      onPressed: () {
                                        pickImage();
                                      },
                                      child: const Icon(Icons.add_a_photo,
                                          size: 50))),
                        )
                      ],
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Name'),
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLines: 3,
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Description'),
                    textInputAction: TextInputAction.next,
                    controller: descriptionController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(labelText: 'Diseases'),
                    textInputAction: TextInputAction.next,
                    controller: diseasesController,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 80, height: 45),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.handsServices
                            .insertData(imageURL, nameController.text, descriptionController.text, diseasesController.text);
                        Navigator.pop(context, true);
                        // Navigator.of(context)
                        //     .pushNamed(DashboardAdminScreen.routeName);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 1, 77, 123)))),
                      child: const Text("Save"),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
