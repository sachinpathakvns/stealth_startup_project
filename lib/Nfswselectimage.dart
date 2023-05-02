import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stealth_startup_project/Data/Service.dart';
import 'dart:io';
import 'Data/Utilities.dart';

class NfswSelectimage extends StatefulWidget {
  const NfswSelectimage({Key? key}) : super(key: key);

  @override
  State<NfswSelectimage> createState() => _NfswSelectimageState();
}

class _NfswSelectimageState extends State<NfswSelectimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Utilities.data.toString()),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  dynamic d = await ServiceProvider().Getimages();
                },
                child: const Text('Data')),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              chooseImage();
              setState(() {

              });
            }, child: const Text('Get image'))
          ],
        ),
      ),
    );
  }

  ImagePicker picker = ImagePicker();


  Future<void> chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      final a = File(pickedFile!.path);
      Utilities.images = pickedFile.path;
      print(pickedFile.path);
      print('Path ${Utilities.images}');
    });
  }
}
