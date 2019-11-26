import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer/second_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          brightness: Brightness.light,
          dividerColor: Colors.green),
      home: MyHomePage(title: 'Timer App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//class Timer extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return TimerState();
//  }
//}

class _MyHomePageState extends State<MyHomePage> {
  static const duration = const Duration(seconds: 1);
  bool isActive = false;
  Timer timer;
  int secondsPassed = 0;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextContainter('HRS', hours.toString().padLeft(2, '0')),
                CustomTextContainter(
                    'Mins', minutes.toString().padLeft(2, '0')),
                CustomTextContainter(
                    'Secs', seconds.toString().padLeft(2, '0')),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  child: Text(isActive ? 'STOP' : 'START'),
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CupertinoButton(
                  color: Colors.cyanAccent,
                  child: Text("Second Screen",
                    style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//text ui
class CustomTextContainter extends StatelessWidget {
  CustomTextContainter(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrangeAccent),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
              color: Colors.white,
              fontSize: 54,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}

//class TimerState extends State<Timer> {
//  bool isActive = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//        child: Text(isActive ? "STOP" : "START"),
//        onPressed: () {
//          setState(() {
//            isActive = !isActive;
//          });
//        });
//  }
//}
