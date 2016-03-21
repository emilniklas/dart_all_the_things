import 'package:flutter/material.dart';
import 'package:flutter/http.dart' as http;
import 'dart:convert' show JSON;

void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => new FlutterDemo()
      }
    )
  );
}

class FlutterDemo extends StatefulWidget {
  _FlutterDemoState createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  final List heroes = [];

  _FlutterDemoState() {
    _load();
  }

  _load() async {
    final heroes = await http.get('http://localhost:1337/heroes')
      .then((r) => r.body)
      .then(JSON.decode);

    setState(() {
      this.heroes.addAll(heroes);
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: heroes.isEmpty
          ? new Text('Loading...')
          : new Column(
            children: heroes.map((Map hero) {
              return new Text('${hero["name"]}, aka ${hero["alias"]}');
            }).toList(),
            mainAxisAlignment: MainAxisAlignment.center
          )
      )
    );
  }
}
