import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanoid_ctse/screens/EditHandPartScreen.dart';
import 'package:humanoid_ctse/screens/EditHeadPartScreen.dart';

import '../services/HeadServices.dart';

class ItemLongCardWidget extends StatelessWidget {
  final service;
  final String? id;
  final String? imageUrl;
  final String? name;
  final String? description;
  final String? diseases;

  ItemLongCardWidget(
      {Key? key,
      required this.service,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.diseases})
      : super(key: key);

  void onPressedDelete() async {
    await service.delete(id!);
    Fluttertoast.showToast(
        msg: "Item Deleted!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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
                          //todo: Edit part
                          Navigator.push(
                            context, MaterialPageRoute(builder:
                             (context) => EditHandPartsScreen(
                               description: description!, 
                               handServices:service, 
                               id: id!, 
                               diseases: diseases!, 
                               imageUrl: imageUrl!, 
                               name: name!,
                              )
                            )
                          );
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
                            onPressedDelete();
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
