import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:humanoid_ctse/services/LegsServices.dart';
import 'package:image_picker/image_picker.dart';

class EditLegsPartsScreen extends StatefulWidget {
  static const routeName = '/edit-legs-parts';
  final LegsServices legsServices;
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final String diseases;

  const EditLegsPartsScreen(
      {Key? key,
      required this.legsServices,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.diseases,
      required this.id})
      : super(key: key);

  @override
  State<EditLegsPartsScreen> createState() => _EditLegsPartsScreenState();
}

class _EditLegsPartsScreenState extends State<EditLegsPartsScreen> {
  XFile? _imagefile;
  String? imageURL;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController diseasesController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    imageURL = widget.imageUrl;
    nameController.text = widget.name;
    descriptionController.text = widget.description;
    diseasesController.text = widget.diseases;
  }

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
      try {
        url = await ref.getDownloadURL();
      } catch (onError) {
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
                                "Edit Part",
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
                          width: double.infinity,
                          height: 150,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: _imagefile != null
                                      ? Image.file(File(_imagefile!.path))
                                      : Image.network(
                                          imageURL!,
                                          width: 80,
                                          height: 80,
                                        )
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    pickImage();
                                  },
                                  child:
                                      const Icon(Icons.add_a_photo, size: 50))
                            ],
                          ),
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
                        widget.legsServices.update(
                            widget.id,
                            nameController.text,
                            descriptionController.text,
                            imageURL!,
                            diseasesController.text);
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
