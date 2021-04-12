import 'package:flutter/material.dart';

class ContainerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Container(
        //confine- restrict the height and width within the certain limits of space
        constraints: BoxConstraints(
            maxHeight:200.0,
            maxWidth: 200.0,
            minHeight:100.0,
            minWidth: 100.0
          //case 1: apply min only : it will take the given values
          //case 2: apply min and max : it will take only the min co-ordinates
          //case 3: apply max only: it will take the child widget width and height, not max values
          //case 4: max width and width infinity : max width
          //case 5: max height and height infinity : max height
          //case 6 : max and min and infinity : max
        ),
        //height: 100.0,width: 200.0, //custom
        //width: double.infinity,  //match_parent
        //height: double.infinity,   //match_parent
        //color: Colors.red,
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0)
        ),
        margin: const EdgeInsets.only(
            top:10.0,
          bottom:10.0,
          right: 10.0,
          left: 20.0 ),
        padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
        child: Text(
            'Container',
        textAlign: TextAlign.center,  //gravity (android)
        ),
      ),
    );
  }
}
