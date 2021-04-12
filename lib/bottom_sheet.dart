import 'package:flutter/material.dart';

class BottomSheetExample extends StatefulWidget {
  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  var _scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //to access the state of the scaffold
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Bottom Sheet'),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Model Bottom Sheet'),
              onPressed: () {
              //the sheet will hide if we are not interacting with it.
              showModalBottomSheet(context: context, builder: (BuildContext context) {
                return Container(
                  height: 100.0,
                  color: Colors.red,
                  child: Text('I am a modal bottom sheet'),
                );
              });
              },),
          RaisedButton(
              child: Text('Persistent Bottom sheet'),
              onPressed: (){
                //Persistent bottom sheet : sheet remain on the screen even though we are not interacting with it.
                // ie. The  bottom sheet will not close if we click/touch on the screen
                _scaffoldKey.currentState.showBottomSheet((context) => Container(
                  height: 100.0,
                  color: Colors.red,
                  child: Text('I am a persistent bottom sheet'),
                ));
              } )
        ],
      ),
    );
  }
}
