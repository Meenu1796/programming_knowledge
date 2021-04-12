import 'package:flutter/material.dart';

class GridViewExample extends StatefulWidget {
  @override
  _GridViewExampleState createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<int> _list=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: GridView(
        scrollDirection: Axis.vertical,
          //true ->the list items appear from last row to first row. ie. in a reverse style
        //also the layout gravity  appear at the bottom
        //default : false
          reverse: false,
        //ScrollController stored as state variable and it is used whe the state re-builds.
        //to get the position of the item in the GridView. (Not clear?)
        controller: ScrollController(
          //suppose we have 100 rows and 3 columns. if we set initialScrollOffset=20,
          // then when we open the page, the scrollbar appear from 20th row leaving
          // first 19 rows considering already scrolled
          initialScrollOffset: 50.0,
          //when set to true, the scroll start from the last offset position where we stopped last time.
          // otherwise, it will always start from the initialScrollOffset value
          keepScrollOffset: true,
        ),
        //determines how the scroll view continues to animate after the user
        // stops dragging the scroll view.
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        //controls the layout of the children
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //fixed number of tiles in the cross axis
            crossAxisCount: 2,
          childAspectRatio: 2.0,
          crossAxisSpacing: 20.0, //column
          mainAxisSpacing: 15.0  //row
        ),
        children: _list.map((e) {
          return Container(
            height: 100.0,
              width: 100.0,
              color: Colors.amber,
              alignment: Alignment.center,
              child: Text('$e'));
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
