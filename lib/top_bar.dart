import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  TopBar(this.title, this.child, this.onPressed, this.onTitleTapped): preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                    tag: 'TopBarBtn',
                    child: Card(

                ))
              ],
            )
          ],
    ));
  }

}