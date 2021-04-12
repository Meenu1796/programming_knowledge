import 'package:flutter/material.dart';

class InkExample extends StatelessWidget {
  const InkExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.android),
      ),
      decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: Colors.blue
      ),
      width: 50.0,
      height: 50.0,
      //can't use color property if we use decoration property
    );
  }
}