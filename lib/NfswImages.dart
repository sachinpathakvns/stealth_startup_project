import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'Data/Service.dart';
import 'Data/Utilities.dart';
import 'dart:io';

class NfswImages extends StatefulWidget {
  const NfswImages({Key? key}) : super(key: key);

  @override
  State<NfswImages> createState() => _NfswImagesState();
}

class _NfswImagesState extends State<NfswImages> {
  static String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('NFSW Images')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Utilities.sd),
            Text(Utilities.er),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  dynamic d = await ServiceProvider().GetNfswurl();
                },
                child: const Text('Data')),
            ],
        ),
      ),
    );
  }

}
