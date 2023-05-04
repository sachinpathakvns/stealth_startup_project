import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stealth_startup_project/Data/Models/Nfswselectimage.dart';
import 'package:stealth_startup_project/Data/Service.dart';
import 'dart:io';
import 'Data/Utilities.dart';

class NfswSelectimage extends StatefulWidget {
  const NfswSelectimage({Key? key}) : super(key: key);

  @override
  State<NfswSelectimage> createState() => _NfswSelectimageState();
}

class _NfswSelectimageState extends State<NfswSelectimage> {
  Nfswselectimage? _nfswurl;
  var isloaded = false;

  getUserDatainfo() async {
    _nfswurl = await ServiceProvider().Getimages();
    if (_nfswurl != null) {
      setState(() {});
      // int saveimage = datas.length;
      Utilitiesselect.erotica = _nfswurl?.erotica.toString();
      Utilitiesselect.bikini = _nfswurl?.suggestiveClasses?.bikini.toString();
      Utilitiesselect.cleavage = _nfswurl?.suggestiveClasses?.cleavage.toString();
      Utilitiesselect.lingerie = _nfswurl?.suggestiveClasses?.lingerie.toString();
      Utilitiesselect.miniskirt =
          _nfswurl?.suggestiveClasses?.miniskirt.toString();
      Utilitiesselect.sexual_activity = _nfswurl?.sexualActivity.toString();
      Utilitiesselect.sexual_display = _nfswurl?.sexualDisplay.toString();
      isloaded = true;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDatainfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('NFSW Select image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("sexual_activity : ${Utilitiesselect.sexual_activity}"),
            Text("sexual_display : ${Utilitiesselect.sexual_display}"),
            Text("erotica : ${Utilitiesselect.erotica}"),
            Text("bikini : ${Utilitiesselect.bikini}"),
            Text("cleavage : ${Utilitiesselect.cleavage}"),
            Text("lingerie : ${Utilitiesselect.lingerie}"),
            Text("miniskirt : ${Utilitiesselect.miniskirt}"),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  dynamic d = await ServiceProvider().Getimages();
                  getUserDatainfo();
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
