import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stealth_startup_project/Data/Service.dart';
import 'Data/Utilities.dart';

class BadTextTracker extends StatefulWidget {
  String a = '';

  @override
  State<BadTextTracker> createState() => _BadTextTrackerState();
}

class _BadTextTrackerState extends State<BadTextTracker> {
  static String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Bad Text Tracker')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 100,
                // width: 100,
                child: TextField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the values',
                  ),
                  onChanged: (value) {
                    try {
                      Utilities.text = value;
                      widget.a= value;
                      setState(() {});
                    } catch (ex) {}
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {});
                    dynamic d = await ServiceProvider().Textcheck('');
                    text = d.body.toString();
                  },
                  child: const Text('GET')),
            ],
          ),
        ),
      ),
    );
  }
}
