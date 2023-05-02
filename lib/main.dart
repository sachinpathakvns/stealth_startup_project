import 'package:flutter/material.dart';
import 'Badtexttracker.dart';
import 'NfswImages.dart';
import 'Nfswselectimage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Double Adder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NSFWTracker(),
    );
  }
}

class NSFWTracker extends StatefulWidget {
  const NSFWTracker({Key? key}) : super(key: key);

  @override
  State<NSFWTracker> createState() => _NSFWTrackerState();
}

class _NSFWTrackerState extends State<NSFWTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Stealth Startup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NfswImages(),
                      ));
                },
                child: const Text('Past a url')),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  BadTextTracker(),
                      ));
                },
                child: const Text('Bad text modifier')),
            ElevatedButton(
                onPressed: () async {
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const NfswSelectimage(),
                      ));
                },
                child: const Text('Select image in gallery')),
          ],
        ),
      ),
    );
  }
}
