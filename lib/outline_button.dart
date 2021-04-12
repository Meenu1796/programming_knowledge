import 'package:flutter/material.dart';

class OutlineButtonExample extends StatelessWidget {
  const OutlineButtonExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      child: Text('Outlune Button'),
      borderSide: BorderSide(
          color: Colors.green,
          width: 3.0,
          style: BorderStyle.solid
      ),
    );
  }
}