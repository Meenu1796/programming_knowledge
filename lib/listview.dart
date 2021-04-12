import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewExample extends StatefulWidget {
  @override
  _ListViewExampleState createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {
  List<int> _integers=[1,2,3,4,5,6,7,8,9,0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
      ),
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //listview
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.greenAccent,
                height: 100.0,
                padding: EdgeInsets.all(15.0),
                width: double.infinity,
                //enables scrolling
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                    Text('Programming Knowledge'),
                  ],
                ),
              ),
            ),
            //listview.map
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.blue,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: _integers.map((e) {
                    return Text('Count : $e');
                  }).toList(),
                ),
              ),
            ),
            //list builder
            Expanded(
              flex: 1,
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                  itemCount : _integers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text('count : ${_integers[index]}');
              }),
            ),
            //list tile
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.amber,
                child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount : _integers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text('Count : ${_integers[index]}'),
                        subtitle: Text('PK'),
                        //widget appear at the start of the layout
                        leading: Icon(Icons.done),
                        //widget appear at the end of the layout
                        trailing: Icon(Icons.close),
                        onTap: () {
                          print('Pressed ${_integers[index]}');
                        },
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
