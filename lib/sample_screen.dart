import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var _list=ModalRoute.of(context).settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(title: Text('Navigator'),),
      body: SafeArea(
          child: Center(
              child: ListView.builder(itemCount: _list.length,
                itemBuilder: (BuildContext context,int index) {
                return ListTile(
                title: Text(_list[index]),
                );
              }
              ,),),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.lock,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
