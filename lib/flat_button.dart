import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class FlatButtonExample extends StatelessWidget {
  final Function showToast;
  FlatButtonExample({ this.showToast});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => showToast(msg: 'Welcome bebe',duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM),
      onLongPress: () {
        print('It hurts!');
      },
      child: Icon(Icons.add),
      //background color
      color: Colors.lightGreenAccent,
      //color of the child widget Ex. Icon became black-when brightness is light
      // and white-when brightness is dark
      colorBrightness: Brightness.dark,
      disabledColor: Colors.cyan,
    );
  }
}
