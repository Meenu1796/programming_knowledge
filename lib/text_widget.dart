import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Programming Knowledge\nProgramming Knowledge\nProgramming Knowledge\nEnd',
      maxLines: 3, //display only 3 lines
      style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.white,
          backgroundColor: Colors.green
      ),
    );
  }
}
