import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:settings/settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          RaisedButton(onPressed: Settings.openWiFiSettings, child: new Text("Open wifi settings")),
        ]),
      ),
    ));
  }
}
