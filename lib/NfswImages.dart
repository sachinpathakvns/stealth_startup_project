import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stealth_startup_project/Data/Models/nfswusingurl.dart';
import 'Data/Service.dart';
import 'Data/Utilities.dart';
import 'dart:io';

class NfswImages extends StatefulWidget {
  const NfswImages({Key? key}) : super(key: key);

  @override
  State<NfswImages> createState() => _NfswImagesState();
}

class _NfswImagesState extends State<NfswImages> {
  Nfswusingurl? _nfswurl;
  var isloaded = false;

  getUserDatainfo() async {
    _nfswurl = await ServiceProvider().GetNfswurl();
    if (_nfswurl != null) {
      setState(() {});
      // int saveimage = datas.length;
      Utilitiesurl.erotica = _nfswurl?.erotica.toString();
      Utilitiesurl.bikini = _nfswurl?.suggestiveClasses?.bikini.toString();
      Utilitiesurl.cleavage = _nfswurl?.suggestiveClasses?.cleavage.toString();
      Utilitiesurl.lingerie = _nfswurl?.suggestiveClasses?.lingerie.toString();
      Utilitiesurl.miniskirt =
          _nfswurl?.suggestiveClasses?.miniskirt.toString();
      Utilitiesurl.sexual_activity = _nfswurl?.sexualActivity.toString();
      Utilitiesurl.sexual_display = _nfswurl?.sexualDisplay.toString();
      isloaded = true;
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDatainfo();
  }

  static String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('NFSW Images')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("sexual_activity : ${Utilitiesurl.sexual_activity}"),
            Text("sexual_display : ${Utilitiesurl.sexual_display}"),
            Text("erotica : ${Utilitiesurl.erotica}"),
            Text("bikini : ${Utilitiesurl.bikini}"),
            Text("cleavage : ${Utilitiesurl.cleavage}"),
            Text("lingerie : ${Utilitiesurl.lingerie}"),
            Text("miniskirt : ${Utilitiesurl.miniskirt}"),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  dynamic d = await ServiceProvider().GetNfswurl();
                  getUserDatainfo();
                },
                child: const Text('Data')),
          ],
        ),
      ),
    );
  }
}
