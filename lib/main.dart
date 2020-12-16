import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Model/sample.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.orangeAccent,
        primarySwatch: Colors.red,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _jsonContent = "";
  String _a = "";
  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      _a = sample.name;
      _jsonContent = sample.toString();
      // sample.name => you can access field from class model
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSampleJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter JSON",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     RaisedButton(
              //       onPressed: () {
              //         _loadSampleJson();
              //       },
              //       child: Text("Read JSON File"),
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  '$_a',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
