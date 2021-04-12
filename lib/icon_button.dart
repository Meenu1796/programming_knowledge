import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class IconButtonExample extends StatelessWidget {
  final Function showToast;
  IconButtonExample({this.showToast});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      iconSize: 45.0,
      //icon color. no background color here
      color: Colors.green,
      //appear when we click on the icon
      splashColor: Colors.amber,
      //a small description about the purpose of the widget
      // which appear when we hover around the icon
      tooltip: 'Icon Button',
      padding: EdgeInsets.all(10.0),
      onPressed: () => showToast(msg:'Icon Button',duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM),
    );
  }
}
