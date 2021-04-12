import 'package:flutter/material.dart';

class MediaQueryExample extends StatefulWidget {
  static const routeName='/media_query';
  @override
  _MediaQueryExampleState createState() => _MediaQueryExampleState();
}

class _MediaQueryExampleState extends State<MediaQueryExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Query'),
      ),
      body: Center(
        child: Container(
          //container height takes half of the height of the screen size
          height: MediaQuery.of(context).size.height/2,
          //container width takes (whole width/3) of screen.
          // eg: screen width=3, then container width =(screen width/3)=3/3=1 ( one-by-third of screen size)
          width: MediaQuery.of(context).size.width/3,
          color: Colors.red,
          //align the child, not the parent
          alignment: Alignment.center,
          child: Text('Hello'),
        ),
      ),
    );
  }
}
