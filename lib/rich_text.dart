import 'package:flutter/material.dart';

class RichTextExample extends StatelessWidget {
  const RichTextExample({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Forgot password?',
          style: TextStyle(
            color: Colors.red,
            fontSize: 15.0,
          ),
          children: <TextSpan> [
            TextSpan(
                text: ' click here.',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14.0,
                )
            ),
            TextSpan(
                text: ' Login',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15.0,
                )
            ),
          ]
      ),
    );
  }
}
