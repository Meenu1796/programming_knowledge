import 'package:flutter/material.dart';

class DismissibleWidgetListview extends StatefulWidget {
  @override
  _DismissibleWidgetListviewState createState() => _DismissibleWidgetListviewState();
}

class _DismissibleWidgetListviewState extends State<DismissibleWidgetListview> {
  List<int> _list=[1,2,3,4,5,6];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Widget, Divider'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            //Divider, Listview.separator
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.amber,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Count : ${_list[index]}'),);
                    },
                    //every item in the list will be separated by
                    // the widget returned by separatorBuilder
                    separatorBuilder: (BuildContext context,int index) {
                      return Divider(
                        color: Colors.red,
                      );
                    },
                    itemCount: _list.length
                ),
              ),
            ),
            //Dismissible Widget
            //swipe to direction to delete/dismiss an item from the list
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.greenAccent,
                child: ListView.builder(
                    itemBuilder: (BuildContext context,int index) {
                      return Dismissible(
                        key: ValueKey(123),  //@required
                          onDismissed: (direction){  // able to dismiss from any direction
                          print(direction);
                          },
                          //display background when user swipe the item eg: delete icon
                          background: Container(
                            margin: EdgeInsets.only(right: 15.0),
                            color: Colors.red,
                            child: Icon(Icons.delete,color: Colors.white,size: 40.0,),
                            alignment: Alignment.centerRight,
                          ),
                          //confirmDismiss: ,
                          direction: DismissDirection.endToStart, //if this property is specified,only
                                                                  //the mentioned direction is applicable
                          child: Card(
                            margin: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 4.0),
                              child: ListTile(
                                title: Text('Count : ${_list[index]}'),)));
                    },
                    itemCount: _list.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
