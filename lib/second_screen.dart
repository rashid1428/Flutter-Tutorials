import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer/main.dart';
import 'package:flutter_timer/top_bar.dart';

class SecondScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: SecondScreenHome()
    );
  }
}

class SecondScreenHome extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SecondScreenHomeState();
  }

}

class SecondScreenHomeState extends State<SecondScreenHome>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: TopBar("Top Bar", child, on, onTitleTapped),
      appBar: AppBar(
        title: Text("Second Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: CupertinoButton(
            color: Colors.deepOrange,
            child: Text("First Screen", style: TextStyle(
                color: Colors.white
            ),
          ),
            onPressed: (){
              setState(() {
                Navigator.pop(context);
//                MaterialPageRoute(builder: (context) => MyApp());
              });
            },
          ),
        ),

      ),
    );
  }

}
