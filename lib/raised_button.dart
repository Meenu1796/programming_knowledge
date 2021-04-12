import 'package:flutter/material.dart';

class RaisedButtonExample extends StatelessWidget {
  const RaisedButtonExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      textColor: Colors.green,
      color: Colors.amber,
      colorBrightness: Brightness.dark,
      //a shadow to z-axis
      elevation: 25.0,
      //case 1 : if we add an anonymous function to the onPressed,
      // then the button is in enabled mode
      //case 2: if we specify null to onPressed, then the button is in disabled mode
      //the background color become grey
      onPressed: null, //() => showToast(msg: 'Welcome bebe',duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM),
      //when onPress has null function
      disabledColor: Colors.blue,
      disabledTextColor: Colors.white,
      child: Text('Raised Button'),
    );
  }
}
